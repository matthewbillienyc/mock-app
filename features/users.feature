Feature: Users Feature

Scenario: A user visits the main page
  Given a user visits the main page
  Then the user sees the field "All Users"
  And the user clicks the link "All Users"
  Then the page navigates to a list of all users

Scenario: A user visits the list of all users
  Given a user visits the list of all users
  Then enters a first and last name into the register user fields
  And Submits the form
  Then the page should add a new user
