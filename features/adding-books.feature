Feature: Adding books
  As a user, I want to add books.

Scenario: I am logged in as TestUser, and add a book
    Given TestUser is logged in
    When TestUser visits the add book page
    And TestUser adds a book
    Then The book is added to the libarary database, but is not approved

Scenario: I am an admin and I want to approve a book
    Given TestAdmin is logged in
    And There is a book that has beed added, but approved
    When TestAdmin visits the approve books page
    And TestAdmin approves the book
    Then The book is now approved
