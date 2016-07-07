Feature: Cases Feature

Scenario: A user visits the cases index
  Given a user visits the cases page
  Then the page navigates to a list of all cases by description

Scenario: A user visits a specific case
  Given a user visiting the specific case
  Then the page should show the description of the case and the user that filled it
