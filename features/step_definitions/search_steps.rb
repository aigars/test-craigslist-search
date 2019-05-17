Given("we navigate to the craigslist housing page") do
  @HousingPage = HousingPage.new(@driver)
  @HousingPage.navigate
end

When("we access sorting dropdown") do
  @HousingPage.clickSearchOrder
end

Then("the dropdown should contain following entries:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  sleep 5
end

When("we search for {string}") do |string|
  @HousingPage.search(string)
end

When("we sort results by price {string}") do |string|
  @HousingPage.sortSearchResults(string)
end

Then("the results should be sorted by price {string}") do |string|
  sleep 5
end
