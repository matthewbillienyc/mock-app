Given(/^$/) do
end

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

Given(/^a user visits the list of all users$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^enters a first and last name into the register user fields$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Submits the form$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the page should add a new user$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
