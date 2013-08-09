class CreateExportRuns < ActiveRecord::Migration
  def change
    create_table :export_runs do |t|
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :record_count
      t.integer :data_source_id
      t.integer :export_set_id

      t.timestamps
    end
  end
end
