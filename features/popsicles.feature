Feature: Popsicles Feature

@stub_popsicles
Scenario: A user visits the popsicle index
  Given a user visits the popsicles page
  Then the page will display all popsicles

@stub_popsicles
Scenario: A user visits a particular popsicle's page
  Given a user visits a specific popsicle's page
  Then the page should display Joke info, company info, stick info, popsicle info, and a rating option

Scenario: A user rates a popsicle
  Given a user visits a specific popsicle's page
  And selects the rating they wish to given the particular popsicle
  And enters any comments they may have
  And hits the "Rate Popsicle" button
  Then the page should reflect this rating

Scenario: A user updates a rating
  Given a user hits the "Update Rating" button
  And enters new information
  And presses the "Update Rating" button
  Then the page should reflect the change
