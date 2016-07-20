Given(/^a user is on the login page$/) do
  visit logon_path
end

And(/^the user enters credentials and clicks log in$/) do
  visit logon_page_path
  fill_in 'email', with: 'test@test.com'
  fill_in 'password', with: 'test'
  click_button 'Log On!'
end

Then(/^the user is logged in$/) do
  page.should have_content 'Logged in as: test@test.com'
end

And(/^the user is redirected to the popsicles workload table$/) do
  expect(page).to have_current_path popsicles_path
end
