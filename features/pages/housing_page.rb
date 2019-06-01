class HousingPage

  URL = "https://helsinki.craigslist.org/d/housing/search/hhh?lang=en&cc=gb"

  SEARCH_QUERY          = { id: 'query' }
  SEARCH_BTN            = { class: 'searchbtn' }
  SEARCH_ORDER_DROPDOWN = { class: 'search-sort' }
  SEARCH_RESULTS        = { id: 'sortable-results' }
  SEARCH_RESULT_PRICE   = { class: 'result-price'}

  def initialize(driver)
    @driver = driver
    navigate
  end

  def navigate
    @driver.get URL
  end

  def click_search_order
    @driver.find_element(SEARCH_ORDER_DROPDOWN).click
  end

  def sort_search_results(order)
    click_search_order
    @driver.find_element(SEARCH_ORDER_DROPDOWN).find_element(:xpath, './/a[contains(., "' + order + '")]').click
  end

  def get_search_order_dropdown_list
    @driver.find_element(SEARCH_ORDER_DROPDOWN).find_elements(:xpath, './/a')
  end

  def get_search_result_prices(currency_string)
    prices = []
    elements = @driver.find_element(SEARCH_RESULTS).find_elements(SEARCH_RESULT_PRICE)
    #add all prices that have currency string to array
    elements.each do |element|
      price = element.text
      prices.push(price.tr(currency_string, '').to_i) if price.include? currency_string
    end
    return prices
  end

  def search(query)
    @driver.find_element(SEARCH_QUERY).send_keys(query)
    @driver.find_element(SEARCH_BTN).click
  end
end
