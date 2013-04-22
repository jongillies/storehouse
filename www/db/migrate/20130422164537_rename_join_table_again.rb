class RenameJoinTableAgain < ActiveRecord::Migration
  def up
    rename_table :export_runs_export_records, :export_records_export_runs
  end

  def down
  end
end
