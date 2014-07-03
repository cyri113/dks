### UTILITY METHODS ###

def create_company hash
	@company = FactoryGirl.create(:company, hash)
end


### GIVEN ###


Given(/^the following companies exist:$/) do |table|
	table.hashes.each do |item|
  	create_company item
  end
end

Given(/^I am associated with a company$/) do
	@company = Company.create! name: "Example Company"
  @user.company = @company
  @user.save
end


### WHEN ###


When(/^I go to the companies index page$/) do
  visit companies_path
end


### THEN ###

Then(/^I should see an option to create company$/) do
  page.should have_content "Create Company"
end

Then(/^I should not see an option to create company$/) do
  page.should_not have_content "Create Company"
end

Then(/^I should see an option to edit company$/) do
  page.should have_content "Edit Company"
end

Then(/^I should not see an option to edit company$/) do
  page.should_not have_content "Edit Company"
end

Then(/^I should see an option to view companies$/) do
  page.should have_content "View Companies"
end

Then(/^I should not see an option to view companies$/) do
  page.should_not have_content "View Companies"
end

Then(/^I should see the following companies:$/) do |table|
  rows = find('#companies-table').all('tr')
	actual = rows.map { |r| r.all('th,td').map { |c| c.text } }
	table.diff! actual
end