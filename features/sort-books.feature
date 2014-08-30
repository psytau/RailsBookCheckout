Feature: Sorting books
  As a user, I want to sort the books view

  @javascript
  Scenario: Sort books on index page
    Given TestUser is logged in
    And And 2 books exist in the system
    And TestUser visits the book index page
    When User clicks the title sort button
    Then The page is sorted ascending
    When User clicks the title sort button
    Then The page is sorted descending