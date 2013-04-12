# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_source do
    name "MyString"
    description "MyText"
    active false
    contact "MyString"
    connection_info "MyText"
  end
end
