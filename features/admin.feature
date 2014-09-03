Feature: Admin Site
  As an admin, I want to be able to do a number of adminstrative activities

  # @javascript
  # Scenario: Prevent a user from being able to rate books.
  #   Given TestAdmin is logged in

  Scenario: View Users Stats
    Given A database populated with users
    And 4 users add 5 books each
    And AdminUser signs in
    Then AdminUser can see 4 users with 5 books each on the stats page
