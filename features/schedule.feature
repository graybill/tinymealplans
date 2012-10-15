Feature: Schedule food into meals.

@javascript
Scenario: Have two weeks worth of meals to plan
  Given I am on the schedule page
  When I follow "This Week"
  Then I should see 6 meals
  When I follow "Next Week"
  Then I should see 6 meals


