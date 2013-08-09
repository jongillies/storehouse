Feature: View Data Source
  In order to view a data sources
  As a user
  I want to view data_sources

  Scenario: DataSources list
    Given I have data_sources
    And I am not logged in
    When I go to the list of data_sources
    Then I should see "Data Source One"
    And I should see "Data Source Two"
    And I should see "user@example.com"
    And I should see "user2@example.com"
    And I should see "true"
    And I should see "false"

