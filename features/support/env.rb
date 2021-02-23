require 'selenium-webdriver'
require 'rspec'

args = ['--headless', '--no-sandbox', '--disable-dev-shm-usage']
options = Selenium::WebDriver::Chrome::Options.new(args: args)
driver = Selenium::WebDriver.for :chrome, options: options

Before do
  @driver = driver
end

After do |scenario|
  #option to embed screenshot if test failed (won't work in headless mode)
  #if scenario.failed?
  #  screenshot = driver.screenshot_as(:base64)
  #  embed("data:image/png;base64,#{screenshot}", 'image/png')
  #end

  #option to exit cucumber if one of tests failed
  #Cucumber.wants_to_quit = true if scenario.failed?
end

at_exit do
  driver.quit
end
