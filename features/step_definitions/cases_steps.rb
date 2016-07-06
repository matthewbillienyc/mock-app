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
