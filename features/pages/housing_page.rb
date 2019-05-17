class HousingPage

  URL = "https://helsinki.craigslist.org/d/housing/search/hhh?lang=en&cc=gb"

  SEARCH_FORM           = { id: 'searchform' }
  SEARCH_QUERY          = { id: 'query' }
  SEARCH_BTN            = { class: 'searchbtn' }
  SEARCH_ORDER_DROPDOWN = { class: 'search-sort' }
  SEARCH_RESULTS        = { id: 'sortable-results' }

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

  def search(query)
    driver.find_element(SEARCH_QUERY).send_keys(query)
    driver.find_element(SEARCH_BTN).click
  end
end
