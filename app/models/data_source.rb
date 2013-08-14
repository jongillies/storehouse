class DataSource < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true
  validates :contact, :presence => true
  validates :description, :presence => true

  attr_accessible :active, :contact, :description, :name, :cron_schedule

  has_many :export_runs, :dependent => :destroy
  has_many :export_records, :dependent => :destroy

  include RocketPants::Cacheable

end
