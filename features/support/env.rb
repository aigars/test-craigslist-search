require 'selenium-webdriver'
require 'rspec'

driver = Selenium::WebDriver.for :chrome

Before do
  @driver = driver
end

After do |scenario|
  #embed screenshot if test failed
  if scenario.failed?
    screenshot = driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{screenshot}", 'image/png')
  end
  #exit cucumber if one of tests failed
  Cucumber.wants_to_quit = true if scenario.failed?
end

at_exit do
  driver.quit
end
