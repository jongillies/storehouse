# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :export_run do
    started_at ""
    finished_at ""
    record_count 1
    data_source_id 1
    export_record_id 1
  end
end
