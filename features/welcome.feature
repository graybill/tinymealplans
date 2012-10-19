Feature: Welcome page

@javascript
Scenario: Create schedule for new user
  Given I am on the welcome page
  When I create a new user named "Joe"
  Then I should see an empty schedule
  And I should see "Cool, here is your schedule!"

@javascript
Scenario: User field is cleared on click
  Given I am on the welcome page
  When I click on the user name field
  Then the food name field should clear
