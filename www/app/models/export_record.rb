class ExportRecord < ActiveRecord::Base
  attr_accessible :record_size

  belongs_to :export_run
  belongs_to :data_source
  #has_one :data_source, :through => :export_runs
end
