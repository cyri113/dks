 Feature: Manage notifications
	In order to show customers notifications
	As a company
	I want to create and manage notifications
	
	Scenario: View published product notification
		Given I have a product named "Example Product" with the code "4321"
		And the product has the following notifications:
			| title		|	content																| published | category	| expiry			|
			| First		|	I am the first product notification! 	| true			| info			| 01-12-2014	|
			| Second	|	I am the second product notification! | true			| danger		|	01-09-2014	|
			| Third		|	I am the third product notification! 	| true	 		|	warning		| 01-06-2014	|
			| Forth		|	I am the forth product notification! 	| false 		| success		|	01-08-2014	|
		When I go to the homepage for code "4321"
		Then I should see the following product notifications:
			| title		|	content																| published | category	| expiry			|
			| First		|	I am the first product notification! 	| true			| info			| 01-12-2014	|
			| Second	|	I am the second product notification! | true			| danger		|	01-09-2014	|
		Then I should not see the following product notfications:
			| title		|	content																| published | category	| expiry			|
			| Third		|	I am the third product notification! 	| true	 		|	warning		| 01-06-2014	|
			| Forth		|	I am the forth product notification! 	| false 		| success		|	01-08-2014	|
		
	Scenario: View published instruction notification
		Given I have a product named "Example Product" with the code "4321"
		And the product has the following instructions:
			| language	| published |
			| English		|	true			|
			| French		|	true			|
			|	German		|	true			|
			|	Russian		|	false			|
		And the instructions have the following notifications:
			| language	|	content																		| published | category	| expiry			|
			| English		|	I am the first instruction notification! 	| true			| info			| 01-12-2014	|
			| French		|	I am the second instruction notification! | true			| danger		|	01-09-2014	|
			| German		|	I am the third instruction notification! 	| true	 		|	warning		| 01-06-2014	|
			| Russian		|	I am the forth instruction notification! 	| false 		| success		|	01-08-2014	|
		When I go to the homepage for code "4321"
		Then I should have the following buttons:
			| content																		| published | category	| expiry			|
			| I am the first instruction notification! 	| true			| info			| 01-12-2014	|
			| I am the second instruction notification! | true			| danger		|	01-09-2014	|
		Then I should not have the following buttons:
			| content																		| published | category	| expiry			|
			| I am the third instruction notification! 	| true	 		|	warning		| 01-06-2014	|
			| I am the forth instruction notification! 	| false 		| success		|	01-08-2014	|
			
	Scenario: View list of notifications
		Given I have a product named "Example Product" with the code "4321"
		And the product has the following notifications:
			|	title								|	content																| published | expiry 			|	category	|
			| First notification	|	I am the first product notification! 	| true			|	01-12-2014	|	info			|
			| Second notification |	I am the second product notification! | true			|	15-09-2014	|	danger		|
			| Third notification	|	I am the third product notification! 	| true	 		|	15-06-2014	|	warning		|
			| Forth notification	|	I am the forth product notification! 	| true	 		|	30-07-2014	|	success		|
		And I am logged in
		When I go to the homepage for code "4321"
		Then I should see a table with the following:
			|	Title								|	Content																| Published | Type		| Expiry Date |
			| Forth notification	|	I am the forth product notification! 	| true	 		|	success	|	2014-07-30	|
			| Third notification	|	I am the third product notification! 	| true	 		|	warning	|	2014-06-15	|
			| Second notification |	I am the second product notification! | true			|	danger	|	2014-09-15	|
			| First notification	|	I am the first product notification! 	| true			|	info		|	2014-12-01	|