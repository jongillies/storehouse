class CreateBlobs < ActiveRecord::Migration
  def change
    create_table :blobs do |t|
      t.string :checksum
      t.text :data

      t.timestamps
    end
  end
end
