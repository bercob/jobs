@feat-users
Feature: Users section

  Scenario: Admin can create a new user "John Doe"
    Given An Admin user exists
    When I log in as an admin
    And I visit new user page
    And I create a "John Doe" user
    Then I should be on "John Doe" detail page
    And I should see a "John Doe" user in list

  Scenario: Admin can delete a user "John Doe"
    Given An Admin user exists
    And A "John Doe" user exists
    When I log in as an admin
    And I visit users page
    And I click on "Delete" in the row with John Doe data
    Then I should not see a "John Doe" user in list

  Scenario: Admin can rename a user "John Doe" email
    Given An Admin user exists
    And A "John Doe" user exists
    When I log in as an admin
    And I visit users page
    And I click on "Edit" in the row with John Doe data
    And I change "Joe Doe" email to "john.d@example.com"
    Then I should be on "John Doe" detail page with new email
    And I should see a "John Doe" user new email in list

  Scenario: Admin can show a user "John Doe"
    Given An Admin user exists
    And A "John Doe" user exists
    When I log in as an admin
    And I visit users page
    And I click on "Show" in the row with John Doe data
    Then I should be on "John Doe" detail page
