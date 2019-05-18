class HousingPage

  URL = "https://helsinki.craigslist.org/d/housing/search/hhh?lang=en&cc=gb"

  SEARCH_FORM           = { id: 'searchform' }
  SEARCH_QUERY          = { id: 'query' }
  SEARCH_BTN            = { class: 'searchbtn' }
  SEARCH_ORDER_DROPDOWN = { class: 'search-sort' }
  SEARCH_RESULTS        = { id: 'sortable-results' }
  SEARCH_RESULT_ROWS    = { class: 'rows'}
  SEARCH_RESULT_PRICE   = { class: 'result-price'}

  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    navigate
  end

  def navigate
    driver.get URL
  end

  def clickSearchOrder
    driver.find_element(SEARCH_ORDER_DROPDOWN).click
  end

  def sortSearchResults(order)
    clickSearchOrder
    driver.find_element(SEARCH_ORDER_DROPDOWN).find_element(:xpath, './/a[contains(., "' + order + '")]').click
  end

  def getSearchOrderDropdownList
    return driver.find_element(SEARCH_ORDER_DROPDOWN).find_elements(:xpath, './/a')
  end

  def getSearchResultPrices
    elements = driver.find_element(SEARCH_RESULTS).find_element(SEARCH_RESULT_ROWS).find_elements(:xpath, './*')
    prices = []
    #add all prices to array until banner is reached
    elements.each do |element|
      break if element.attribute('class').include? 'ban'
      price = element.find_element(SEARCH_RESULT_PRICE).text.tr('€', '').to_i
      prices.push(price)
    end

    return prices
  end

  def search(query)
    driver.find_element(SEARCH_QUERY).send_keys(query)
    driver.find_element(SEARCH_BTN).click
  end
end
