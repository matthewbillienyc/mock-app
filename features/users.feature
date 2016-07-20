Feature: Users Feature

@stub_workload
Scenario: A user visits the main page
  Given a user visits the main page
  Then the user sees the field "All Users"
  And the user clicks the link "All Users"
   