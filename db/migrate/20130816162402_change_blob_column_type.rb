class ChangeBlobColumnType < ActiveRecord::Migration
  def up
    change_column :blobs, :data, :text,:default => nil, :null => true
  end

  def down
  end
end
