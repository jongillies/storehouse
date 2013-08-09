Feature: View First Data Source
  In order to view a data sources
  As a user
  I want to view data_sources

  Scenario: DataSources show as admin should see protected fields
    Given I have data_sources
    Given I exist as an administrator
    Given I sign in with valid credentials
    Given I go to the first data source
    Then I should see and admin link

