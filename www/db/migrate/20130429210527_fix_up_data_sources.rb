class FixUpDataSources < ActiveRecord::Migration
  def up
    rename_column :data_sources, :connection_info, :primary_store
    add_column :data_sources, :secondary_stores, :text
  end

  def down
  end
end
