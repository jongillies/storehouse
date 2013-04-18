# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :export_set do
    record_size 1
    data_record_id 1
    export_run_id 1
  end
end
