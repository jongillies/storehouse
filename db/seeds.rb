# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
#

YAML::load_file('db/seeds/roles_and_users.yml')['roles'].each do |role|
  role = Role.find_or_create_by_name({:name => role}, :without_protection => true)
  puts "Role> #{role.name}"
end

YAML::load_file('db/seeds/roles_and_users.yml')['users'].each do |_, user|
  db_user = User.find_or_create_by_email name:                  user['name'],
                                         email:                 user['email'],
                                         password:              user['password'],
                                         password_confirmation: user['password'],
                                         authentication_token:  user['authentication_token']
  user['roles'].each do |role|
    db_user.add_role role
  end
  puts "User> #{db_user.name} #{db_user.email}"
end

YAML::load_file('db/seeds/data_sources.yml').each do |data_source|
  ds = DataSource.find_or_create_by_name(data_source, :without_protection => true)
  puts "DataSource> #{ds.name}"
end

YAML::load_file('db/seeds/export_runs.yml').each do |export_run|
  er = ExportRun.find_or_create_by_id(export_run, :without_protection => true)
  puts "ExportRun> #{er.created_at}"
end

YAML::load_file('db/seeds/export_records.yml').each do |export_record|
  er = ExportRecord.find_or_create_by_id(export_record, :validate => false, :without_protection => true)
  puts "ExportRecord> #{er.created_at}"
end

YAML::load_file('db/seeds/export_runs_finish.yml').each do |export_run|
  er = ExportRun.find_or_create_by_id(export_run, :without_protection => true)
  er.update_attributes(export_run)
  puts "ExportRun> #{er.created_at}"
end

