class ExportSetsController < ApplicationController
  # GET /export_sets
  # GET /export_sets.json
  def index
    @search = ExportSet.search(params[:q])
    @export_sets  = @search.result.order(:created_at).page params[:page]

    @export_run = ExportRun.find_by_id(params[:export_run_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @export_sets }
    end
  end

  # GET /export_sets/1
  # GET /export_sets/1.json
  def show
    @export_set = ExportSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @export_set }
    end
  end

  # POST /export_sets
  # POST /export_sets.json
  def create
    @export_set = ExportSet.new(params[:export_set])

    respond_to do |format|
      if @export_set.save
        format.html { redirect_to @export_set, notice: 'Export set was successfully created.' }
        format.json { render json: @export_set, status: :created, location: @export_set }
      else
        format.html { render action: "new" }
        format.json { render json: @export_set.errors, status: :unprocessable_entity }
      end
    end
  end

end
