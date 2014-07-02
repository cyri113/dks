Feature: Manage Instructions
	In order to show customers instructions
	As a company
	I want to create and manage instructions
	
	Scenario: View published instructions
		Given I have a product named "Example Product" with the code "4321"
		And the product has the following instructions:
			| language	| published |
			| English		|	true			|
			| French		|	true			|
			|	German		|	false			|
			|	Russian		|	false			|
		When I go to the homepage for code "4321"
		Then I should see "English"
		And I should see "French"
		And I should not see "German"
		And I should not see "Swedish"