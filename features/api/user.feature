Feature: User API
  As a client application
  I want to retrieve user data
  So that I can display it in my application

  Scenario: Retrieving a user
    Given there is a user with email "test@example.com"
    When I send a GET request to "/users/1"
    Then the response should be 200
    And the response should include the user's email
