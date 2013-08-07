class Blob < ActiveRecord::Base
  attr_accessible :checksum, :data

  has_many :export_records, foreign_key: :checksum
  has_many :data_sources, through: :export_records

  validates :checksum, :presence => true #, :uniqueness => true
  validates :data, :presence => true

  before_validation :update_blob_data_to_json_string

  include RocketPants::Cacheable

  self.primary_key = :checksum

  private

  def update_blob_data_to_json_string
      unless self.data.is_a?(Hash) || self.data.is_a?(Array)
        h = {}
        h['value'] = self.data
        self.data = h
      end
      self.data = self.data.to_json if self.data
  end

end
