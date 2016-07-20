Feature: Users Feature

@stub_logon @stub_popsicle_summaries
Scenario: A user can sign in
  Given a user is on the login page
  And the user enters credentials and clicks log in
  Then the user is logged in
  And the user is redirected to the popsicles workload table

@stub_admin_logon @stub_popsicle_summaries
Scenario: An admin user can sign in
  Given a user is on the login page
  And the user enters admin credentials and clicks log in
  Then the user in logged in as admin
  And the user is redirected to the popsicles workload table

@stub_logon @stub_popsicle_summaries
Scenario: A user can sign in
  Given a user is logged in on the popsicles workload table
  And the user clicks logout
  Then the user is logged out
