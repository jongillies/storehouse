class ExportRecord < ActiveRecord::Base

  belongs_to :export_run
  belongs_to :data_source

  belongs_to :blob, foreign_key: :checksum

  attr_accessible :record_size, :created_at, :checksum, :location_pointer, :primary_key, :export_run_id, :data_source_id

  attr_accessible :blob_attributes

  validates_presence_of :checksum, :primary_key

  validates :export_run, presence: true
  validates :data_source, presence: true

  after_validation :validate_record

  validates_uniqueness_of :checksum, :scope => [:export_run_id]

  #before_create :remove_blob_if_already_exists

  accepts_nested_attributes_for :blob

  def as_json(options={})
    {:record_size => self.record_size,
     :created_at => self.created_at,
     :export_run_id => self.export_run_id,
     :checksum => self.checksum,
     :primary_key => self.primary_key,
     :data_source_id => self.data_source_id,
     :data => JSON.parse(self.blob.data)}
  end

  private

  def remove_blob_if_already_exists
    if Blob.find_by_checksum(self.checksum)
      self.blob = nil
    end

  end

  def validate_record
    my_export_run = ExportRun.find_by_id(self.export_run_id)

    return false unless my_export_run

    unless my_export_run.finished_at.nil?
      errors.add(:export_run_id, 'this export run has already been completed.')
    end

  end

end
