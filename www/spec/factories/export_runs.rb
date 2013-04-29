# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :export_run do
    id 1
    started_at Time.now
    finished_at Time.now
    duration 0
    record_count 1
    data_source_id 1
  end
end
