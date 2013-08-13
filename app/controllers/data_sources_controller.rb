class DataSourcesController < ApplicationController

  def index
    @search = DataSource.search(params[:q])
    @data_sources = @search.result.order(:name).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @data_source = DataSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @data_source = DataSource.new

    authorize! :destroy, DataSource, message: 'Not authorized as an administrator.'

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    authorize! :edit, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.find(params[:id])
  end

  def create
    authorize! :create, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.new(params[:data_source])

    respond_to do |format|
      if @data_source.save
        format.html { redirect_to @data_source, notice: 'Data source was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    authorize! :update, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.find(params[:id])

    respond_to do |format|
      if @data_source.update_attributes(params[:data_source])
        format.html { redirect_to @data_source, notice: 'Data source was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    authorize! :destroy, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.find(params[:id])
    @data_source.destroy

    respond_to do |format|
      format.html { redirect_to data_sources_url }
    end
  end

  def default_serializer_options
    {root: false}
  end

end
