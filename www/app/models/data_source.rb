class DataSource < ActiveRecord::Base
  attr_accessible :active, :connection_info, :contact, :description, :name
end
