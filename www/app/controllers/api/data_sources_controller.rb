class Api::DataSourcesController < RocketPants::Base
  # GET /data_sources
  # GET /data_sources.json
  def index
    #@search = DataSource.search(params[:q])
    #@data_sources = @search.result.order(:name).page params[:page]
    #
    #respond_to do |format|
    #  format.json do
    #    authorize! :read, DataSource, message: 'Not authorized for API use.'
    #    render json: @data_sources
    #  end
    #end

    expose DataSource.paginate(:page => params[:page])

  end

  # GET /data_sources/1
  # GET /data_sources/1.json
  def show
    expose DataSource.find(params[:id])
  end

  # POST /data_sources
  # POST /data_sources.json
  def create
    authorize! :create, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.new(params[:data_source])

    respond_to do |format|
      if @data_source.save
        format.html { redirect_to @data_source, notice: 'Data source was successfully created.' }
        format.json { render json: @data_source, status: :created, location: @data_source }
      else
        format.html { render action: "new" }
        format.json { render json: @data_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data_sources/1
  # PUT /data_sources/1.json
  def update
    authorize! :update, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.find(params[:id])

    respond_to do |format|
      if @data_source.update_attributes(params[:data_source])
        format.html { redirect_to @data_source, notice: 'Data source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_sources/1
  # DELETE /data_sources/1.json
  def destroy
    authorize! :destroy, DataSource, message: 'Not authorized as an administrator.'

    @data_source = DataSource.find(params[:id])
    @data_source.destroy

    respond_to do |format|
      format.html { redirect_to data_sources_url }
      format.json { head :no_content }
    end
  end

  def default_serializer_options
    {root: false}
  end

end
