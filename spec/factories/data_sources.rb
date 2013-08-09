# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_source do
    name "MyString"
    description "MyText"
    active false
    contact "MyString"
    #primary_store "MyText"
    #secondary_stores "Secondary"
    cron_schedule "* * * * *"
  end
end
