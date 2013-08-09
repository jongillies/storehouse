class AddDataChecksumToExportRecords < ActiveRecord::Migration
  def change
    add_column :export_records, :checksum, :string
    add_column :export_records, :location_pointer, :string
    add_column :export_records, :primary_key, :string
    remove_column :export_records, :data_record_id

    add_index :export_records, :checksum
    add_index :export_records, :location_pointer
    add_index :export_records, :primary_key
  end
end
