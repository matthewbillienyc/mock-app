#=========================================#
#             ###View Records###          #
#=========================================#
Given(/^a user visits the main page$/) do
  visit root_path
end

Then(/^the user sees the field "(.*?)"$/) do |link_text|
  expect(page).to have_content(link_text)
end

And(/^the user clicks the link "(.*?)"$/) do |link_text|
  click_link(link_text)
end

Then(/^the page navigates to a list of all users$/) do
  has_selector?('ul')
end

#=========================================#
#             ###Create Records###        #
#=========================================#
Given(/^a user visits the list of all users$/) do
  visit users_path
end

Then(/^enters a first and last name into the register user fields$/) do
  fill_in 'user_first_name', :with => 'Capy'
  fill_in 'user_last_name', :with => 'Bara'
end

Then(/^the user clicks the button "(.*?)"$/) do |button_text|
  click_link_or_button(button_text)
end

Then(/^the page should add a new user$/) do
  has_text?("Capy Bara")
  has_link?("Capy Bara")
end

#=========================================#
#             ###Edit Records###          #
#=========================================#
Given(/^a user visits a given user record$/) do
  visit 'users/1'
end

Then(/^the user presses the button "(.*?)"$/) do |button_text|
  click_button(button_text)
end

Then(/^fills out the new first name and last name forms$/) do
  fill_in 'user_first_name', :with => 'Capy'
  fill_in 'user_last_name', :with => 'Bara'
end

Then(/^clicks "([^"]*)"$/) do |button_text|
  click_button(button_text)
end

Then(/^the user record should reflect the name change$/) do
  has_text?('Capy Bara')
  has_no_text?("CapyBara")
end
