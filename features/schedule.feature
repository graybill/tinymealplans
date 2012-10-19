Feature: Schedule food into meals.

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
  And I should see "Monday (1)"
  And I add "fish" to "Monday"
  Then I should see "fish"
  And I should see "Monday (2)"
  When I refresh the page
  Then I should see "rice"
  And I should see "fish"

@javascript
Scenario: Remove food from meal
  Given I am a user
  And I am on my schedule page
  And I follow "This Week"
  And I add "peaches" to "Monday"
  And I add "rice" to "Monday"
  And I add "tacos" to "Monday"
  When I remove "rice" from "Monday"
  Then I should not see "rice"
  And I should see "Monday (2)"
  When I remove "peaches" from "Monday"
  Then I should not see "peaches"
  And I should see "Monday (1)"
  When I refresh the page
  Then I should not see "rice"


