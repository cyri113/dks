### UTILITY METHODS ###

def create_invitee
	@invitee ||= { :email => "invitee@example.com" }
end

def create_visitor
  @visitor ||= { :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def confirm_account
	@user.confirmed_at = DateTime.now
	@user.save
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def invite
  visit new_user_invitation_path
  fill_in "user_email", with: @invitee[:email]
  click_button "Send an invitation"
end

def sign_in
  visit new_user_session_path
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit destroy_user_session_path
end

Given /^I am logged in$/ do
	create_user
  confirm_account
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I exist as a confirmed user$/ do
  create_user
  confirm_account
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

Given /^I am a authenticated user$/ do
  create_confirmed_user
  sign_in
end

Given /^I have confirmed my account$/ do
  confirm_account
end

Given(/^I am a manager$/) do
  @user.role = :manager
  @user.save
end

Given(/^I am a admin$/) do
  @user.role = :admin
  @user.save
end

Given(/^I am a operator$/) do
  @user.role = :operator
  @user.save
end

Given(/^I am on the user index page$/) do
  visit users_path
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I invite a user with valid user data$/ do
  create_invitee
  invite
end

When /^I invite a user with an invalid email$/ do
  create_invitee
  @invitee = @invitee.merge(:email => "notanemail")
  invite
end

When(/^I invite an existing user$/) do
  create_invitee
  @invitee = @user
  invite
end


When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "user_current_password", :with => @visitor[:password]
  click_button "Update"
end

When /^I look at the list of users$/ do
  visit '/'
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I should see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I should see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I should see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my email$/ do
  create_user
  page.should have_content @user[:email]
end

Then(/^I should see a successful invitation message$/) do
  page.should have_content "An invitation email has been sent to #{@invitee[:email]}."
end

Then(/^I should see an invalid email invitation message$/) do
  page.should have_content "Email is invalid"
end

Then(/^I should see email already taken invite message$/) do
  page.should have_content "Email has already been taken"
end