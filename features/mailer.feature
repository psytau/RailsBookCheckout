Feature: Application sendaing emails
  The application will send emails based on 

Scenario: My book has been rated, and I am opted to recieve email updates
    Given Book has been rated
    And And the user wishes to recieve rate emails
    Then The application triggers an email to be sent notifying me of the rating

Scenario: My book has been reviewed and I am opted to recieve email updates
    Given Book has been reviewed
    And And the user wishes to recieve review emails
    Then The application triggers an email to be sent notifying me of the review

Scenario: I wish to invite a new user to the application
    Given TestUser is logged in
    And TestUser gives an email address in the invite form
    Then The invite email is sent