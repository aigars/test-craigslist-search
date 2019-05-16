Feature: Search

Scenario: Default sorting possibilities
  Given we navigate to the craigslist housing page
  When we access sorting dropdown
  Then the dropdown should contain following entries:
    | text      | href                                    |
    | upcoming  | /search/hhh?sort=upcoming&lang=en&cc=gb |
    | newest    | /search/hhh?sort=date&lang=en&cc=gb     |
    | price ↑   | /search/hhh?sort=priceasc&lang=en&cc=gb |
    | price ↓   | /search/hhh?sort=pricedsc&lang=en&cc=gb |

Scenario: After search more sorting possibilities are available
  Given we navigate to the craigslist housing page
  When we search for "Helsinki"
  And we access sorting dropdown
  Then the dropdown should contain following entries:
    | text      | href                                                                  |
    | upcoming  | /search/hhh?sort=upcoming&lang=en&cc=gb                               |
    | newest    | /search/hhh?sort=date&availabilityMode=0&query=Helsinki&lang=en&cc=gb |
    | newest    | /search/hhh?sort=date&lang=en&cc=gb                                   |
    | price ↑   | /search/hhh?sort=priceasc&lang=en&cc=gb                               |
    | price ↓   | /search/hhh?sort=pricedsc&lang=en&cc=gb                               |

Scenario Outline: Sorting by price
  Given we navigate to the craigslist housing page
  When we sort results by price "<order>"
  Then the results should be sorted by price "<order>"

  Examples:
    | order      |
    | ascending  |
    | descending |
