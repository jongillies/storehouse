class ExportRecord < ActiveRecord::Base
  attr_accessible :data_record_id, :record_size

  belongs_to :export_run
  has_one :data_source, :through => :export_runs
end
