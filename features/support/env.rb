require 'selenium-webdriver'
require 'rspec'

driver = Selenium::WebDriver.for :chrome

Before do
  @driver = driver
end

After do |scenario|
  #exit cucumber if one of tests failed
  Cucumber.wants_to_quit = true if scenario.failed?
end

at_exit do
  driver.quit
end
