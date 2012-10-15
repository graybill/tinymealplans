Given /^I am on the schedule page$/ do
  visit schedule_index_path
end

When /^I follow "(.*?)"$/ do |arg1|
  click_link arg1
end

Then /^I should see (\d+) meals$/ do |arg1|
  page.should have_selector('div.meal', :count => arg1.to_i, :visible => true)
end