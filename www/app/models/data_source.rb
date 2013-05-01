class DataSource < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true
  validates :contact, :presence => true
  validates :description, :presence => true

  attr_accessible :active, :primary_store, :secondary_stores, :contact, :description, :name, :cron_schedule

  has_many :export_runs, :dependent => :destroy
  has_many :export_records, :dependent => :destroy

  # Exclude protected attributes from json output.
  #def to_json(options={})
  #  options[:except] ||=  [ :primary_store, :secondary_stores, :cron_schedule ]
  #  super(options)
  #end

end
