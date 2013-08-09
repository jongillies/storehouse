class CreateBlobs < ActiveRecord::Migration
  def change
    create_table :blobs, :null => false do |t|
      t.string :checksum, :null => false
      t.text :data, :null => false

      t.timestamps
    end

    add_index :blobs, :checksum, :unique => true
  end
end
