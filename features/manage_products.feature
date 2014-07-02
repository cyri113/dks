Feature: Manage Products
	In order to show customers products
	As a company
	I want to create and manage products
	
	Scenario: View product
		Given I have a product named "Example Product" with the code "4321"
		When I go to the homepage for code "4321"
		Then I should see "Example Product"
		And I should see "4321"
		
	Scenario: View non-existant product
		Given there are no products
		When I go to the homepage for code "4321"
		Then I should see "Oops... Something went wrong."
		And I should see "The code 4321 was not recognised by dokspot."
		
	Scenario: View product with updated code
		Given I have a product named "Example Product" with the code "4321"
		When I update the product:
			| code	 |
			| 1234	 |
		And I go to the homepage for code "4321"
		Then I should see "Example Product"
		And I should see "1234"
		
	Scenario: Search for product
		Given I have a product named "Example Product" with the code "4321"
		And I am on the root page
		When I search for "4321"
		And I click on "Spot It"
		Then I should see "Example Product"