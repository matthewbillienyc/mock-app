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
  visit show_case_path(1)
end

Then(/^the page should show the description of the case and the user that filled it$/) do
  has_text?('A new and interesting turn of events')
  has_link?('Jarlett Scohanson')
end
