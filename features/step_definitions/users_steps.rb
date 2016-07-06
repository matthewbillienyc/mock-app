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
