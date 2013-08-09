class RemovePrimaryStoreSecondaryStoreFromDataSources < ActiveRecord::Migration
  def up
    remove_column :data_sources, :primary_store
    remove_column :data_sources, :secondary_stores
  end

  def down
  end
end
