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


  Scenario Outline: DataSources list as admin should see New button
    Given I have data_sources
    Given I exist as an administrator
    Given I sign in with valid credentials
    Given I go to the list of data_sources
    Then I should see and admin link
    Then I should see link "New"
    Then I should see a "<arg>" button
  Examples:
    | arg |
    | Search |
    | Clear |

#
#
#  Scenario: User signs in successfully
#    Given I exist as a user
#    And I am not logged in
#    When I sign in with valid credentials
#    Then I see a successful sign in message
#    When I return to the site
#    Then I should be signed in
#
#  Scenario: User enters wrong email
#    Given I exist as a user
#    And I am not logged in
#    When I sign in with a wrong email
#    Then I see an invalid login message
#    And I should be signed out
#
#  Scenario: User enters wrong password
#    Given I exist as a user
#    And I am not logged in
#    When I sign in with a wrong password
#    Then I see an invalid login message
#    And I should be signed out

