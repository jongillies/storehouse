class ExportRun < ActiveRecord::Base
  attr_accessible :data_source_id, :export_set_id, :finished_at, :record_count, :started_at

  belongs_to :data_source
  has_and_belongs_to_many :export_sets
end
