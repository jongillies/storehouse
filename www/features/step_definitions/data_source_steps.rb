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

#And(/^I should see "(.*?)"$/) do |arg1|
#  pending # express the regexp above with the code you wish you had
#end