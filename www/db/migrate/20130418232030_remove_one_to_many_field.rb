class RemoveOneToManyField < ActiveRecord::Migration
  def up
    remove_column :export_sets, :export_run_id
    remove_column :export_runs, :export_set_id
  end

  def down
  end
end
