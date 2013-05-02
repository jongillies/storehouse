class DataSourceSerializer < ActiveModel::Serializer
  attributes :id,
  :name,
  :description,
  :active,
  :contact,
  :primary_store,
  :secondary_stores,
  :cron_schedule,
  :created_at,
  :updated_at

  delegate :current_user, to: :scope
  delegate :can?, to: :scope

  def attributes
    data = super
    # data[:edit_url] = edit_data_source_url(object) if can?(:read, DataSource)
    data
  end


end
