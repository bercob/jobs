Feature: Users can login and logout

  Scenario: With wrong credentials
    Given An user exists
    When I visit the login page
    And I enter wrong credentials
    When I click on "Login"
    Then I should see message "Login failed"
    And The page should be the login page

  Scenario: With correct credentials
    Given An user exists
    When I visit the login page
    And I enter correct credentials
    When I click on "Login"
    Then I should see message "Login successful"
    And The page should be the users page
