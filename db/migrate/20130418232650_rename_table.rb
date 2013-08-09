class RenameTable < ActiveRecord::Migration
  def up
    rename_table :export_sets_export_runs, :export_runs_export_sets
  end

  def down
  end
end
