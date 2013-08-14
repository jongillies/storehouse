class ExportRun < ActiveRecord::Base

  attr_accessible :data_source_id, :finished_at, :record_count, :started_at, :duration

  belongs_to :data_source
  has_many :export_records, dependent: :destroy

  before_save :update_duration
  before_create :set_started_at
  after_validation :validate_record
  before_destroy :remove_dependent_export_records

  validates :data_source, presence: true, on: :create
  validates :finished_at, presence: true, on: :update
  validates :record_count, presence: true, on: :update

  include RocketPants::Cacheable

  private

  def remove_dependent_export_records
    ExportRecord.delete_all(export_run_id: self.id)
  end

  def update_duration
    unless finished_at.nil?
      self.duration = finished_at - started_at
      self.duration = 0 if self.duration < 0  # Just in case the times are jacked
    end
  end

  def validate_record
    unless self.finished_at_was.nil?
        self.errors.add(:id, 'this export run has already been completed.')
    end
  end

  def set_started_at
    self.started_at = Time.now if self.started_at.nil?
  end
end
