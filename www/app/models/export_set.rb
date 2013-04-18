class ExportSet < ActiveRecord::Base
  attr_accessible :data_record_id, :export_run_id, :record_size

  belongs_to :export_run
end
