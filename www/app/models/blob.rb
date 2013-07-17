class Blob < ActiveRecord::Base
  attr_accessible :checksum, :data

  has_many :export_records, foreign_key: :checksum
  has_many :data_sources, through: :export_records

  validates :checksum, :presence => true, :uniqueness => true
  validates :data, :presence => true

  # hmmm.. I guess we get to the blob via the export_record
  # do does it need this relationship?
  # Because the blob is created or reference upon the export_record create....

#  validates :export_run, presence: true
#  validates :data_source, presence: true

  # DEPRECATION WARNING: Calling set_primary_key is deprecated. Please use `self.primary_key = 'the_name'` instead. (called from <class:Blob> at /Users/jxgillie/repos/github/jongillies/storehouse/www/app/models/blob.rb:6)
  # set_primary_key :checksum
  self.primary_key = :checksum


end
