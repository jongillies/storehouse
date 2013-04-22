class ExportRecord < ActiveRecord::Base
  attr_accessible :data_record_id, :record_size

  has_and_belongs_to_many :export_runs
end
