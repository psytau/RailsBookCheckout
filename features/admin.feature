Feature: Admin Site
  As an admin, I want to be able to do a number of adminstrative activities

  @javascript
  Scenario: Prevent a user from being able to rate books.
    Given A database populated with users and books
    And TestAdmin is logged in
    And TestAdmin bans 2 users from rating
    Then The 2 users cannot rate books
    But TestAdmin allows the 2 users to rate again
    And The 2 users try to rate a book 5
    Then The rating for the book is 5

  @javascript
  Scenario: Prevent a user from reviewing books.
    Given A database populated with users and books
    And TestAdmin is logged in
    And TestAdmin bans 2 users from reviewing books
    Then The 2 users cannot review books

  @javascript
  Scenario: Make a user an admin
    Given A database populated with users
    And TestAdmin is logged in
    And Test admin makes 2 users into admins
    Then Those 2 users are admins

  Scenario: View Users Stats
    Given A database populated with users
    And 4 users add 5 books each
    And AdminUser signs in
    Then AdminUser can see 4 users with 5 books each on the stats page
