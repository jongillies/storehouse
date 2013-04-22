class RenameExportSetToExportRecord < ActiveRecord::Migration
  def up
    rename_column :export_runs_export_sets, :export_set_id, :export_record_id
    rename_table :export_sets, :export_records
    rename_table :export_runs_export_sets, :export_runs_export_records

  end

  def down
    rename_table :export_records, :export_sets
  end
end
