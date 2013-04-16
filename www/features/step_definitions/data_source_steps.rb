def create_data_source
  @ds1 ||= {:name        => "Data Source One",
            :contact     => "user@example.com",
            :description => "description",
            :active => true
  }
  DataSource.create(@ds1)
  @ds2 ||= {:name        => "Data Source Two",
            :contact     => "user2@example.com",
            :description => "description 2",
            :active => false
  }
  DataSource.create(@ds2)

end

def find_data_source
  ds ||= DataSource.where(email: @visitor[:email]).first
end


Given(/^I have data_sources$/) do
  create_data_source
end


When(/^I go to the list of data_sources$/) do
  visit data_sources_path
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

When(/^I should see a "([^"]*)" button$/) do |arg|
  page.should have_button(arg)
end

When(/^I should see link "([^"]*)"$/) do |arg|
  page.should have_link(arg)
end

When(/^I am logged in as admin$/) do
  pending
end