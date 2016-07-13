Feature: Cases Feature

@stub_workload
Scenario: A user visits the cases index
  Given a user visits the cases page
  Then the page navigates to a list of all cases by description

@stub_workload
Scenario: A user visits a specific case
  Given a user visiting the specific case
  Then the page should show the description of the case and the user that filed it


@create_case
Scenario: A user creates a new case
  Given a user visits the case index page
  And fills out the form for a new case
  And hits the "Create Case" button
  Then a link to the new case should be appended to the list of cases

@stub_workload
Scenario: A user edits an existing case
  Given a user visits a given case's page
  And fills out the form for a new description
  And presses the "Update Case" button
  Then the show page should reflect the new description
