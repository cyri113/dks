Then(/^show me the page$/) do
  save_and_open_page
end

When(/^I am on the root page$/) do
  visit root_path
end