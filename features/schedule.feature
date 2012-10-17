Feature: Schedule food into meals.

@javascript
Scenario: Create schedule for new user
  Given I am on the welcome page
  When I create a new user named "Joe"
  Then I should see an empty schedule
  And I should see "Cool, here is your schedule!"

@javascript
Scenario: Automatically have two weeks of lunches to plan
  Given I am a user
  And I am on my schedule page
  When I follow "This Week"
  Then I should see 6 meals
  When I follow "Next Week"
  Then I should see 6 meals

@javascript
Scenario: Add food to meal
  Given I am a user
  And I am on my schedule page
  And I add "rice" to "Monday"
  Then I should see "rice"
  When I refresh the page
  Then I should see "rice"

@javascript
Scenario: Remove food from meal
  Given I am a user
  And I am on my schedule page
  And I follow "This Week"
  And I add "rice" to "Monday"
  When I remove "rice" from "Monday"
  Then I should not see "rice"
  When I refresh the page
  Then I should not see "rice"
