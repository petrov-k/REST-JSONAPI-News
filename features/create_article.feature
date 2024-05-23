Feature: Article creation
  As a blog author
  I want to create an article
  So that I can share my thoughts wiht the world

  Scenario: Creating a valid article
    Given I have article_params
    When I create the article
    Then the article should be saved in the database
