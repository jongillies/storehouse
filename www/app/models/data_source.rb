class DataSource < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true
  validates :contact, :presence => true
  validates :description, :presence => true

  attr_accessible :active, :connection_info, :contact, :description, :name
end
