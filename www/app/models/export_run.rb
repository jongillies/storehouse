class ExportRun < ActiveRecord::Base

  attr_accessible :data_source_id, :finished_at, :record_count, :started_at, :duration

  belongs_to :data_source
  has_many :export_records

  before_save :update_duration

  before_create :set_started_at

  validates :data_source, presence: true, on: :create
  validates :finished_at, presence: true, on: :update
  validates :record_count, presence: true, on: :update

  after_validation :validate_record

  private

  def update_duration
    if !duration && finished_at && started_at
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
    self.started_at = Time.now
  end
end
