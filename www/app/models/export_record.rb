class ExportRecord < ActiveRecord::Base

  attr_accessible :record_size, :created_at, :checksum, :location_pointer, :primary_key, :export_run_id, :data_source_id

  validates_presence_of :checksum, :location_pointer, :primary_key, :export_run_id, :data_source_id

  belongs_to :export_run
  belongs_to :data_source

  belongs_to :blob, foreign_key: :checksum

  def as_json(options={})
    {:record_size => self.record_size,
     :created_at => self.created_at,
     :export_run_id => self.export_run_id,
     :checksum => self.checksum,
     :primary_key => self.primary_key,
     :data_source_id => self.data_source_id,
     :data => self.blob.data}
  end
end
