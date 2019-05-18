Feature: Search

Scenario: Default sorting possibilities
  Given we navigate to the craigslist housing page
  When we access sorting dropdown
  Then the dropdown should contain following entries:
    | text      | href                      |
    | upcoming  | /search/hhh?sort=upcoming |
    | newest    | /search/hhh?sort=date     |
    | price ↑   | /search/hhh?sort=priceasc |
    | price ↓   | /search/hhh?sort=pricedsc |

Scenario: After search more sorting possibilities are available
  Given we navigate to the craigslist housing page
  When we search for "Helsinki"
  And we access sorting dropdown
  Then the dropdown should contain following entries:
    | text      | href                      |
    | upcoming  | /search/hhh?sort=upcoming |
    | newest    | /search/hhh?sort=date     |
    | relevant  | /search/hhh?sort=rel      |
    | price ↑   | /search/hhh?sort=priceas  |
    | price ↓   | /search/hhh?sort=pricedsc |

Scenario Outline: Sorting by price
  Given we navigate to the craigslist housing page
  When we sort results by price "<text>"
  Then the results should be sorted by price "<order>"

  Examples:
    | text     | order |
    | price ↑  | asc   |
    | price ↓  | desc  |
