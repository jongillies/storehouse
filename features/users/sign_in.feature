Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

  Scenario: User signs in successfully
    Given I exist as a user
    When I sign in with valid credentials
    Then I see a successful sign in message
    When I return to the site
    Then I should be signed in
    Then I should not see and admin link

  Scenario: Administrator signs in successfully
    Given I exist as an administrator
    When I sign in with valid credentials
    Then I see a successful sign in message
    When I return to the site
    Then I should be signed in
    Then I should see and admin link

  Scenario: User enters wrong email
    Given I exist as a user
    And I am not logged in
    When I sign in with a wrong email
    Then I see an invalid login message
    And I should be signed out

  Scenario: User enters wrong password
    Given I exist as a user
    And I am not logged in
    When I sign in with a wrong password
    Then I see an invalid login message
    And I should be signed out

