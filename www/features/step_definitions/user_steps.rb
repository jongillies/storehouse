### UTILITY METHODS ###

def create_visitor
  @visitor ||= {name:     'Testy McUserton', email: 'example@example.com',
                password: 'changeme', password_confirmation: 'changeme'}
end

def find_user
  @user ||= User.where(email: @visitor[:email]).first
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def delete_user
  @user ||= User.where(email: @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_in
  visit '/users/sign_in'
  fill_in 'user_email', with: @visitor[:email]
  fill_in 'user_password', with: @visitor[:password]
  click_button 'Sign in'
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given(/^I exist as an administrator$/) do
  create_user
  @user.add_role('admin')
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(email: 'wrong@example.com')
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(password: 'wrongpass')
  sign_in
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content 'Logout'
  page.should_not have_content 'Login'
end

Then /^I should be signed out$/ do
  page.should have_content 'Login'
  page.should_not have_content 'Logout'
end

Then /^I see a successful sign in message$/ do
  page.should have_content 'Signed in successfully.'
end

Then /^I should see an invalid email message$/ do
  page.should have_content 'is invalid'
end

Then /^I should see a missing password message$/ do
  page.should have_content 'can\'t be blank'
end

Then /^I should see a signed out message$/ do
  page.should have_content 'Signed out successfully.'
end

Then /^I see an invalid login message$/ do
  page.should have_content 'Invalid email or password.'
end
Then(/^I should see and admin link$/) do
  page.should have_content 'Admin'
end
Then(/^I should not see and admin link$/) do
  page.should_not have_content 'Admin'
end
