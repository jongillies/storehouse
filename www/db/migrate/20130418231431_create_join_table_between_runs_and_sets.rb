class CreateJoinTableBetweenRunsAndSets < ActiveRecord::Migration
  def self.up
    create_table :export_sets_export_runs, :id => false do |t|
      t.integer :export_set_id
      t.integer :export_run_id
    end

    add_index :export_sets_export_runs, [:export_set_id, :export_run_id]
  end

  def self.down
    drop_table :export_sets_export_runs
  end
end
