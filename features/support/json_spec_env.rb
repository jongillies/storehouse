require 'json_spec/cucumber'

def last_json
  # don't mix Capybara and Rack::Test for testing JSON APIs!
  last_response.body
end