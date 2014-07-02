Feature: Manage Companies
	
	
	### CREATE COMPANY ###
	
	
	Scenario: Admin can create a company
		Given I exist as a confirmed user
		And I am a admin
		When I sign in with valid credentials
		Then I should see an option to create company
		
	Scenario: Manager cannot create a company
		Given I exist as a confirmed user
		And I am a manager
		When I sign in with valid credentials
		Then I should not see an option to create company
		
	Scenario: Operator cannot create a company
		Given I exist as a confirmed user
		And I am a operator
		When I sign in with valid credentials
		Then I should not see an option to create company
		
		
	### EDIT OWN COMPANY ###
		
		
	Scenario: Manager can edit company
		Given I exist as a confirmed user
		And I am a manager
		When I sign in with valid credentials
		Then I should see an option to edit company
		
	Scenario: Operator cannot edit company
		Given I exist as a confirmed user
		And I am a operator
		When I sign in with valid credentials
		Then I should not see an option to edit company
		
	Scenario: Admin cannot edit company
		Given I exist as a confirmed user
		And I am a admin
		When I sign in with valid credentials
		Then I should not see an option to edit company
		
	### VIEW COMPANIES ###
		
		
	Scenario: Admin can view list of companies
		Given I exist as a confirmed user
		And I am a admin
		When I sign in with valid credentials
		Then I should see an option to view companies
		
	Scenario: Manager can view list of companies
		Given I exist as a confirmed user
		And I am a manager
		When I sign in with valid credentials
		Then I should not see an option to view companies
		
	Scenario: Operator can view list of companies
		Given I exist as a confirmed user
		And I am a operator
		When I sign in with valid credentials
		Then I should not see an option to view companies