Feature: User API

  Scenario: Index action
    Given I am a valid API user
    When I visit /api/1/data_sources
    Then It should be good
    Then the JSON response should have 1 responsexx
#    And the JSON response at "0/id" should be 1
#    And the JSON response at "1/id" should be 2



#Feature: List data_sources
#  As an API client
#  In order to do things with data_sources
#  I want to retrieve a list of data_sources
#
#  Scenario: retrieve all data_sources as JSON
#    Given I am a valid API user
#    When I send a GET request for "/api/1/data_sources"
#    Then the response should be "200"
##    And the JSON response should be a "response" array with 1 elements
#
##  Scenario: retrieve all data_sources as JSON
##    Given I am a valid API user
##    And I send and accept JSON
##    And I have 1 domain with 5 "A" records
##    When I send a GET request for "/data_sources"
##    Then the response should be "200"
##    And the JSON response should be an array with 1 "domain" elements