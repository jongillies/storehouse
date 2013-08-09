class CreateExportSets < ActiveRecord::Migration
  def change
    create_table :export_sets do |t|
      t.integer :record_size
      t.integer :data_record_id
      t.integer :export_run_id

      t.timestamps
    end
  end
end
