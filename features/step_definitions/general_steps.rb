### WHEN ###


When(/^I am on the root page$/) do
  visit root_path
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_on arg1
end


### THEN ###

Then(/^show me the page$/) do
  save_and_open_page
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^I should not see "(.*?)"$/) do |arg1|
	page.should_not have_content(arg1)
end

Then(/^I should see a no right to access message$/) do
	page.should have_content "You don't have the right to access this page."
end