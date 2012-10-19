When /^I create a new user named "(.*?)"$/ do |arg1|
  within("#new_user") do
    fill_in('user_handle', :with => arg1)
  end
  click_button("Create")
end

When /^I click on the user name field$/ do
  within("#new_user") do
    fill_in('user_handle', :with => "")
  end
end

Then /^the food name field should clear$/ do
  page.should have_selector('#user_handle', :text => "", :visible => true)
end