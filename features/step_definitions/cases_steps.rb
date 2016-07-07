#========================================#
#     A user visits the cases index      #
#========================================#
Given(/^a user visits the cases page$/) do
  visit cases_path
end

Then(/^the page navigates to a list of all cases by description$/) do
  has_selector?('ul')
  has_text?('Cases by Description')
end

#========================================#
#     A user visits a specific case      #
#========================================#
Given(/^a user visiting the specific case$/) do
  case_in_Q = { description: "A new case because of a typo on Form 324(j)", user_id: 4 }
  user = { first_name: 'Bob', last_name: 'Bobb' }
  stub_request(:get, %r{.*\/cases}).
    to_return(:status => 200, :body => case_in_Q.to_json, :headers => {})
  stub_request(:get, %r{.*\/users}).
    to_return(:status => 200, :body => user.to_json, :headers => {})

  visit show_case_path(1)
end

Then(/^the page should show the description of the case and the user that filed it$/) do
  page.has_text?("Bob Bobb")
  page.has_text?("A new case because of a typo on Form 324(j)")
end

#========================================#
#     A user creates a new case          #
#========================================#
Given(/^a user visits the case index page$/) do

  visit cases_path
end

Given(/^fills out the form for a new case$/) do
  fill_in 'case_description', :with => 'The mountain stirs once more'
end

Given(/^hits the "([^"]*)" button$/) do |arg1|
  stub_request(:post, %r{.*\/cases})
    .to_return(status: 200, body: "", headers: {})

  click_button(arg1)
end

Then(/^a link to the new case should be appended to the list of cases$/) do
  byebug
  page.has_text?("Your case added successfully")
end

#========================================#
#     A user edits an existing case      #
#========================================#

Given(/^a user visits a given case's page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^fills out the form for a new description$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^presses the "([^"]*)" button$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the show page should reflect the new description$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
