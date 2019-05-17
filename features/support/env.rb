require 'selenium-webdriver'
require 'rspec'

Before do
  @driver = Selenium::WebDriver.for :chrome
end

After do
  @driver.quit
end
