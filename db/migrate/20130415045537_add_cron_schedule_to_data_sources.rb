class AddCronScheduleToDataSources < ActiveRecord::Migration
  def change
    add_column :data_sources, :cron_schedule, :string
  end
end
