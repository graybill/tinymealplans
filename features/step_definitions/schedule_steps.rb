Given /^I am on the schedule page$/ do
  visit schedule_index_path
end


When /^I follow "(.*?)"$/ do |arg1|
  click_link arg1
  within("h2") do
    page.should have_content(arg1)
  end
end

Then /^I should see (\d+) meals$/ do |arg1|
  page.should have_selector('div.meal', :count => arg1.to_i, :visible => true)
end

Given /^I add "(.*?)" to "(.*?)"$/ do |arg1, arg2|
  # does not use the day (yet)
  within("#new_food") do
    fill_in('food_name', :with => arg1)
  end
  click_button("Add")
end

When /^I remove "(.*?)" from "(.*?)"$/ do |arg1, arg2|
  click_link("Remove")
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should not see "(.*?)"$/ do |arg1|
  page.should_not have_content(arg1)
end

When /^I refresh the page$/ do
  visit schedule_index_path
end

Given /^show me the page$/ do
  save_and_open_page
end