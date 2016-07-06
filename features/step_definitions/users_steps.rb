Given(/^$/) do
end

Given(/^a user visits the main page$/) do
  visit root_path
end

Then(/^the user sees the field "(.*?)"$/) do |link_text|
  page.expect have_content(link_text)
end

And(/^the user clicks the "(.*?)" link$/) do |link_text|
  page.click link_text
end