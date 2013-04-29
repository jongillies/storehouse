class ExportRun < ActiveRecord::Base

  attr_accessible :data_source_id, :finished_at, :record_count, :started_at, :duration

  belongs_to :data_source
  has_many :export_records

  before_create :update_duration

  validates :data_source_id, :presence => true

  private

  def update_duration
    self.duration = finished_at - started_at
  end

end
