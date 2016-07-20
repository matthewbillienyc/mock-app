###login(generic)###
Given(/^a user is on the login page$/) do
  visit logon_page_path
end

And(/^the user enters credentials and clicks log in$/) do
  fill_in 'email', with: 'test@test.com'
  fill_in 'password', with: 'test'
  click_button 'Log On!'
end


###Login as admin####
Then(/^the user is logged in$/) do
  page.should have_content 'Logged in as: test@test.com'
end

And(/^the user is redirected to the popsicles workload table$/) do
  expect(page).to have_current_path popsicles_path
end

And(/^the user enters admin credentials and clicks log in$/) do
  fill_in 'email', with: 'admin@admin.com'
  fill_in 'password', with: 'admin'
  click_button 'Log On!'
end

Then(/^the user in logged in as admin$/) do
  has_content?('Fancy admin features!')
end

###Logout###
Given (/^a user is logged in on the popsicles workload table$/) do
  visit_popsicles_path
end

And (/^the user clicks logout$/) do
  click_link 'Logout'
end

Then (/^the user is logged out$/) do
  has_content?('Login')
end
