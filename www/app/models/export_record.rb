class ExportRecord < ActiveRecord::Base
  attr_accessible :data_record_id, :record_size

  has_and_belongs_to_many :export_runs
  has_many :data_sources, :through => :export_runs
end
