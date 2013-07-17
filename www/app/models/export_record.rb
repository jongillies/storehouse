class ExportRecord < ActiveRecord::Base

  belongs_to :export_run
  belongs_to :data_source

  belongs_to :blob, foreign_key: :checksum

  attr_accessible :record_size, :created_at, :checksum, :location_pointer, :primary_key, :export_run_id, :data_source_id

  validates_presence_of :checksum, :primary_key

  validates :export_run, presence: true
  validates :data_source, presence: true


  # TODO Should not be able to create an export record if ( export_run, data_source and checksum)
  #      already exists

  before_create :validate_record

  #def as_json(options={})
  #  {:record_size => self.record_size,
  #   :created_at => self.created_at,
  #   :export_run_id => self.export_run_id,
  #   :checksum => self.checksum,
  #   :primary_key => self.primary_key,
  #   :data_source_id => self.data_source_id,
  #   :data => self.blob.data}
  #end

  private

  def validate_record

  end
end
