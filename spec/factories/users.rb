# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :role do
    name 'user'
  end

  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'

    roles {[FactoryGirl.create(:role)]}
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
