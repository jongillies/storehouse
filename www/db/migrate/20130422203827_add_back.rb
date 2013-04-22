class AddBack < ActiveRecord::Migration
  def up
    add_column :export_records, :export_run_id, :integer
    drop_table :export_records_export_runs
  end

  def down
  end
end
