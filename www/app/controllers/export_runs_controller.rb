class ExportRunsController < ApplicationController
  # GET /export_runs
  # GET /export_runs.json
  def index
    @search = ExportRun.search(params[:q])
    @export_runs  = @search.result.order(:started_at).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @export_runs }
    end
  end

  # GET /export_runs/1
  # GET /export_runs/1.json
  def show
    @export_run = ExportRun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @export_run }
    end
  end

  # POST /export_runs
  # POST /export_runs.json
  def create
    @export_run = ExportRun.new(params[:export_run])

    authorize! :create, @export_run, message: 'Not authorized as an administrator.'

    respond_to do |format|
      if @export_run.save
        format.json { render json: @export_run, status: :created, location: @export_run }
      else
        format.json { render json: @export_run.errors, status: :unprocessable_entity }
      end
    end
  end

end
