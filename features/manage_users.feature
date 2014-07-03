Feature: User Management
	As a user
	I want to sign in
	So I can visit protected areas of the site
	
	Scenario: User cannot sign in if not registered
		Given I do not exist as a user
		When I sign in with valid credentials
		Then I should see an invalid login message
		
	Scenario: User can sign in with valid credentials
  	Given I exist as a user
  	And I have confirmed my account
  	And I am not logged in
  	When I sign in with valid credentials
  	Then I should see a successful sign in message
  	
	Scenario: User cannot sign in without confirming account
		Given I exist as a user
  	And I am not logged in
  	When I sign in with valid credentials
  	Then I should see an unconfirmed account message
	
	Scenario: User cannot sign in with wrong email
		Given I exist as a user
		And I am not logged in
		When I sign in with a wrong email
		Then I should see an invalid login message
		
	Scenario: User cannot sign in with wrong password
		Given I exist as a user
		And I am not logged in
		When I sign in with a wrong password
		Then I should see an invalid login message
		
	Scenario: Manager invites a new user with valid user data
		Given I exist as a user
		Given I am a manager
		Given I am a authenticated user
		When I invite a user with valid user data
		Then I should see a successful invitation message
	
	Scenario: User invites a new user with invalid email
		Given I exist as a user
		And I am logged in
		When I invite a user with an invalid email
		Then I should see an invalid email invitation message

	Scenario: User invites an existing user
		Given I exist as a user
		And I am logged in
		When I invite an existing user
		Then I should see email already taken invite message
		
	Scenario: User signs out successfully
		Given I am logged in
		When I sign out
		Then I should see a signed out message
		
	Scenario: Manager can view company users
		#Given I am logged in
		#And I am a manager
		#And I am member of a company
		#And the company has the following members:
		#	| Email						| 
		#	|	m1@example.com	|
		#	|	o1@example.com	|
		#	|	o2@example.com	|
		#And I am on the user index page
		#Then I should see
		
	Scenario: Manager can delete operator account
		#Given I am logged in
		#And I am a manager
		#And I am on the user index page
		#When I click on delete
		#Then I should see a user deleted message