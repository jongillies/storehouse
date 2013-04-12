class CreateDataSources < ActiveRecord::Migration
  def change
    create_table :data_sources do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.string :contact
      t.text :connection_info

      t.timestamps
    end
  end
end
