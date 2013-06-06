class ExportRecord < ActiveRecord::Base

  attr_accessible :record_size, :created_at, :checksum, :location_pointer, :primary_key, :export_run_id, :data_source_id

  validates_presence_of :checksum, :location_pointer, :primary_key, :export_run_id, :data_source_id

  belongs_to :export_run
  belongs_to :data_source

  belongs_to :blob, foreign_key: :checksum

end
