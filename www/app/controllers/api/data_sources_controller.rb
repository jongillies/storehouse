class Api::DataSourcesController < RocketPants::Base

  include Devise::Controllers::Helpers
  include CanCan::ControllerAdditions

  before_filter :authenticate_user!

  #TODO: https://github.com/filtersquad/rocket_pants/issues/7
  #TODO: https://github.com/filtersquad/rocket_pants/issues/43
  #TODO: https://gist.github.com/lukebyrne/3224885

  map_error! CanCan::AccessDenied, RocketPants::Forbidden

  def index
    authorize! :read, DataSource, message: 'Not authorized for API use.'

    @search = DataSource.search(params[:q])
    expose @search.result.order(:name).page params[:page]
  end

  def show
    authorize! :read, DataSource, message: 'Not authorized for API use.'

    expose DataSource.find(params[:id])
  end

  def create
    authorize! :create, DataSource, message: 'Not authorized as an administrator.'

    expose DataSource.create!(params[:data_source]), status: :created
  end

  def update
    authorize! :update, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.find(params[:id])

    @data_source.update_attributes(params[:data_source])

    expose @data_source
  end

  def destroy
    authorize! :destroy, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.find(params[:id])
    @data_source.destroy

  end

end
