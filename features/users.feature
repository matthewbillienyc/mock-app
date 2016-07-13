Feature: Users Feature

@stub_workload
Scenario: A user visits the main page
  Given a user visits the main page
  Then the user sees the field "All Users"
  And the user clicks the link "All Users"
  Then the page navigates to a list of all users

@stub_workload
Scenario: A user creates a new user record
  Given a user visits the list of all users
  Then enters a first and last name into the register user fields
  And the user clicks the button "Create User"
  Then the page should add a new user

@stub_workload
Scenario: User edits an existing user record
  Given a user visits a given user record
  Then the user presses the button "Edit This User"
  And fills out the new first name and last name forms
  And clicks "Update User"
  Then the user record should reflect the name change
