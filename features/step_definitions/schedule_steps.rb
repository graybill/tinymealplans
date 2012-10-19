Given /^I am a user$/ do 
  @user = FactoryGirl.create(:user, :handle => "mrmcmuffin")
end

Given /^I am on my schedule page$/ do
  visit user_schedule_index_path @user
end

Given /^I am on the welcome page$/ do
  visit welcome_index_path
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

Then /^I should see an empty schedule$/ do
  page.should have_selector('div.meal a', :count => 6, :text => /(0)/, :visible => true)
end

Given /^I add "(.*?)" to "(.*?)"$/ do |food, day|
  within(".#{day.downcase} #new_food") do
    fill_in('food_name', :with => food)
  end
  click_button("Add")
end

When /^I remove "(.*?)" from "(.*?)"$/ do |food, day|
  # find food in day
  within(".#{day.downcase} tr.#{food}") do
    click_link("remove")
  end
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should not see "(.*?)"$/ do |arg1|
  page.should_not have_selector('tr', :text => arg1, :visible => true)
end

When /^I refresh the page$/ do
  visit user_schedule_index_path @user
end

Then /^show me the page$/ do
  save_and_open_page
end