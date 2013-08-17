class AddSomeIndexes < ActiveRecord::Migration
  def up
    add_index :export_records, :export_run_id
    add_index :export_records, :data_source_id
  end

  def down
  end
end
