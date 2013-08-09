class AddDataSourceToExportRecord < ActiveRecord::Migration
  def change
    add_column :export_records, :data_source_id, :integer
  end
end
