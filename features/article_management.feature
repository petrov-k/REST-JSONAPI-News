Feature: Article management

  Scenario: List articles
    Given there are articles
    When I send a GET request to "/api/v1/articles"
    Then the response status should be "200"
    And the response should include the articles

  Scenario: Show an article
    Given there is an article
    When I send a GET request to "/api/v1/articles/{id}"
    Then the response status should be "200"
    And the response should include the article

  Scenario: Create an article
    When I send a POST request to "/api/v1/articles" with the following json:
      """
      {
        "article": {
          "title": "New Article",
          "content": "This is a new article."
        }
      }
      """
    Then the response status should be "201"
    And the response should include the new article

  Scenario: Update an article
    Given there is an article
    When I send a PUT request to "/api/v1/articles/{id}" with the following json:
      """
      {
        "article": {
          "title": "Updated Article",
          "content": "This is an updated article."
        }
      }
      """
    Then the response status should be "200"
    And the response should include the updated article

  Scenario: Delete an article
    Given there is an article
    When I send a DELETE request to "/api/v1/articles/{id}"
    Then the response status should be "204"
    And the article should be deleted
