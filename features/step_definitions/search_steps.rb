Given("we navigate to the craigslist housing page") do
  @housing_page = HousingPage.new(@driver)
end

When("we access sorting dropdown") do
  @housing_page.search_order_dropdown.click
end

Then("the dropdown should contain following entries:") do |table|
  data = table.hashes
  elements = @housing_page.search_order_list
  #check that no entries are missing
  expect(elements.length).to eq(data.length)
  #go through dropdown elements and compare them with data from table
  elements.each_with_index do |element, i|
    expect(element.text).to eq(data[i]['text'])
    expect(element.attribute('href')). to include(data[i]['href'])
  end
end

When("we search for {string}") do |query|
  @housing_page.search_input.send_keys(query)
  @housing_page.search_btn.click
end

When("we sort results by {string}") do |order|
  @housing_page.search_order_dropdown.click
  @housing_page.search_order_item(order).click
end

Then("the results should be sorted by price {string} in {string}") do |order, currency|
  prices = @housing_page.search_result_prices(currency)
  #compare prices we got with prices we sorted
  expect(prices).to eq(prices.sort) if order == 'price ↑'
  expect(prices).to eq(prices.sort.reverse) if order == 'price ↓'
end
