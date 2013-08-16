class ChangeBlobColumnType < ActiveRecord::Migration
  def up
    change_column :blobs, :data, :text, :limit => 4294967295, :default => nil, :null => true
  end

  def down
  end
end
