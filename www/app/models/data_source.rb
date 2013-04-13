class DataSource < ActiveRecord::Base

  rolify

  validates :name, :presence => true, :uniqueness => true
  validates :contact, :presence => true
  validates :description, :presence => true

  devise :database_authenticatable

  attr_accessible :active, :connection_info, :contact, :description, :name
end
