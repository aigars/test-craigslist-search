class HousingPage
  #only page layout/elements should be described here

  URL = "https://helsinki.craigslist.org/d/housing/search/hhh?lang=en&cc=gb"

  def initialize(driver)
    @driver = driver
    navigate
  end

  def navigate
    @driver.get URL
  end

  def search_order_dropdown
    @driver.find_element(:class, 'search-sort')
  end

  def search_order_list
    search_order_dropdown.find_elements(:xpath, './/a')
  end

  def search_order_item(order)
    search_order_dropdown.find_element(:xpath, './/a[contains(., "' + order + '")]')
  end

  def search_results
    @driver.find_element(:id, 'sortable-results')
  end

  def search_result_prices(currency)
    search_results.find_elements(:class, 'result-price').select { |element| element.text.include? currency }.map { |element| element.text.tr(currency, '').to_i }
  end

  def search_input
    @driver.find_element(:id, 'query')
  end

  def search_btn
    @driver.find_element(:class, 'searchbtn')
  end
end
