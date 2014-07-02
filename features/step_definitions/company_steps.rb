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