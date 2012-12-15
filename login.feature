Feature: Behat Login to the demo area
  As an administrator
  I want to test login access to Demo
  So I can access restricted area

  @javascript
  Scenario: check login form
    Given I am on "/demo/secured/login"
    Then I should be on "/demo/secured/login"
    And the response should contain "Login"

  Scenario: fill login form
    Given I am on "/demo/secured/login"
    When I fill in "username" with "admin"
    And I fill in "password" with "adminpass"
    And I press "LOGIN"
    Then I should see "Welcome!"

  Scenario: Unexisting user cannot access demo secured area
    Given I am on "/demo/secured/login"
    When I fill in "username" with "fakeuser"
    And I fill in "password" with "adminpass"
    And I press "LOGIN"
    Then I should see "Bad credentials"

  Scenario: Existing user with bad password cannot access demo secured area
    Given I am on "/demo/secured/login"
    When I fill in "username" with "admin"
    And I fill in "password" with "fakepass"
    And I press "LOGIN"
    Then I should see "Bad credentials"

  Scenario: Logout
    Given I am logged in as "admin" with password "adminpass"
    Given I am on "/demo/secured/hello/World"
    When I follow "Logout"
    Then I should be on "/demo/"
    And I should see "LOGIN"
    Then show last response