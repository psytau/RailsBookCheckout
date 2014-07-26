Feature: Accessing books
  As a user, I want to access information about the books

Scenario: Access book titles and ratings in the library
  Given User visits the webpage
  When User accesses the books page when not logged in
  Then User can can see all the book titles
    And User can can see all the ratings

