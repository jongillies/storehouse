class Api::DataSourcesController < RocketPants::Base
  # GET /data_sources
  # GET /data_sources.json

  #map_error! CanCan::AccessDenied, RocketPants::Forbidden

  #include CanCan::ControllerAdditions
  #include CanCan::Ability

  def index
    #authorize! :read, DataSource #, message: 'Not authorized for API use.' if current_user

    @search = DataSource.search(params[:q])
    expose @search.result.order(:name).page params[:page]
  end

  # GET /data_sources/1
  # GET /data_sources/1.json
  def show
    expose DataSource.find(params[:id])
  end

  # POST /data_sources
  # POST /data_sources.json
  def create
    #authorize! :create, DataSource, message: 'Not authorized as an administrator.'

    expose DataSource.create!(params[:data_source]), status: :created
  end

  # PUT /data_sources/1
  # PUT /data_sources/1.json
  def update
    #authorize! :update, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.find(params[:id])

    @data_source.update_attributes(params[:data_source])

    expose @data_source
  end

  # DELETE /data_sources/1
  # DELETE /data_sources/1.json
  def destroy
    #authorize! :destroy, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.find(params[:id])
    @data_source.destroy

    redirect_to data_source_path version: 1
  end

  def default_serializer_options
    {root: false}
  end


end
