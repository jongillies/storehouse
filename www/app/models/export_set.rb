class ExportSet < ActiveRecord::Base
  attr_accessible :data_record_id, :export_run_id, :record_size

  has_and_belongs_to_many :export_run
end
