class Blob < ActiveRecord::Base
  attr_accessible :checksum, :data

  validates :checksum, :presence => true, :uniqueness => true

  set_primary_key :checksum

  has_many :export_records, foreign_key: :checksum

  has_many :data_sources, through: :export_records

end
