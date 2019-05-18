require 'selenium-webdriver'
require 'rspec'

driver = Selenium::WebDriver.for :chrome

Before do
  @driver = driver
end

After do |scenario|
  Cucumber.wants_to_quit = true if scenario.failed? #exit cucumber i one of tests failed
end

at_exit do
  driver.quit
end
