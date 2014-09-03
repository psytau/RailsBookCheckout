Feature: Admin Site
  As an admin, I want to be able to do a number of adminstrative activities

  @javascript
  Scenario: Prevent a user from being able to rate books.
    Given TestAdmin is logged in
    And TestAdmin adds a book on the add book page
    And A TestUser exists in the system
    And AdminUser bans the user from rating the book.
    And It is true that the book has a rating of 0 stars
    When TestUser gives a rating of 5 stats
    And It is still true that the book has a rating of 0 stars

