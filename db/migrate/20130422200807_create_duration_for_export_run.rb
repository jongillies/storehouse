class CreateDurationForExportRun < ActiveRecord::Migration
  def up
    add_column :export_runs, :duration, :integer
  end

  def down
  end
end
