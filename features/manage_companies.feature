Feature: Manage Companies
	
	
	### CREATE COMPANY ###
	
	
	Scenario: Admin can see create company option
		Given I exist as a confirmed user
		And I am a admin
		When I sign in with valid credentials
		Then I should see an option to create company
		
	Scenario: Manager cannot see create company option
		Given I exist as a confirmed user
		And I am a manager
		When I sign in with valid credentials
		Then I should not see an option to create company
		
	Scenario: Operator cannot see create company option
		Given I exist as a confirmed user
		And I am a operator
		When I sign in with valid credentials
		Then I should not see an option to create company
		
		
	### EDIT OWN COMPANY ###
		
		
	Scenario: Manager can see edit company option
		Given I exist as a confirmed user
		And I am a manager
		When I sign in with valid credentials
		Then I should see an option to edit company
		
	Scenario: Operator cannot see edit company option
		Given I exist as a confirmed user
		And I am a operator
		When I sign in with valid credentials
		Then I should not see an option to edit company
		
	Scenario: Admin cannot see edit company option
		Given I exist as a confirmed user
		And I am a admin
		When I sign in with valid credentials
		Then I should not see an option to edit company
		
	### VIEW COMPANIES ###
		
		
	Scenario: Admin can view list companies option
		Given I exist as a confirmed user
		And I am a admin
		When I sign in with valid credentials
		Then I should see an option to view companies
		
	Scenario: Manager cannot view list companies option
		Given I exist as a confirmed user
		And I am a manager
		When I sign in with valid credentials
		Then I should not see an option to view companies
		
	Scenario: Operator cannot view list companies option
		Given I exist as a confirmed user
		And I am a operator
		When I sign in with valid credentials
		Then I should not see an option to view companies
		
	Scenario: Admin can view list of companies
		Given I exist as a confirmed user
		And I am a admin
		And the following companies exist:
			| name 			| sym | website		 |
			|	Company 1 | C1 	| www.c1.com |
			|	Company 2 | C2 	| www.c2.com |
			|	Company 3 | C3 	| www.c3.com |
			|	Company 4 | C4 	| www.c4.com |
		When I sign in with valid credentials
		When I click on "View Companies"
		Then I should see the following companies:
			| Name 			| Symbol	| Website		 |
			|	Company 1 | C1 			| www.c1.com |
			|	Company 2 | C2			| www.c2.com |
			|	Company 3 | C3			| www.c3.com |
			|	Company 4 | C4			| www.c4.com |
			
	Scenario: Manager cannot view list of companies
		Given I exist as a confirmed user
		And I am a manager
		And I am associated with a company
		When I sign in with valid credentials
		And I go to the companies index page
		Then I should see a no right to access message
		
	Scenario: Operator cannot view list of companies
		Given I exist as a confirmed user
		And I am a operator
		When I sign in with valid credentials
		And I go to the companies index page
		Then I should see a no right to access message
		
	Scenario: Visitor cannot view list of companies
		Given I do not exist as a user
		When I go to the companies index page
		Then I should see a sign in to continue message