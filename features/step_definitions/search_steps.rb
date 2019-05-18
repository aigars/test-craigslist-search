Given("we navigate to the craigslist housing page") do
  @HousingPage = HousingPage.new(@driver)
  @HousingPage.navigate
end

When("we access sorting dropdown") do
  @HousingPage.clickSearchOrder
end

Then("the dropdown should contain following entries:") do |table|
  data = table.hashes
  elements = @HousingPage.getSearchOrderDropdownList
  #go through dropdown elements and compare them with data from table
  elements.each_with_index do |element, i|
    expect(element.text).to eq(data[i]['text'])
    expect(element.attribute('href')). to include(data[i]['href'])
  end
end

When("we search for {string}") do |string|
  @HousingPage.search(string)
end

When("we sort results by {string}") do |string|
  @HousingPage.sortSearchResults(string)
end

Then("the results should be sorted by price {string}") do |string|
  prices = @HousingPage.getSearchResultPrices
  #compare prices we got with prices we sorted
  expect(prices).to eq(prices.sort) if string == 'price ↑'
  expect(prices).to eq(prices.sort.reverse) if string == 'price ↓'
end
