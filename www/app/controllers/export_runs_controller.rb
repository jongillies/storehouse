class ExportRunsController < ApplicationController
  # GET /export_runs
  # GET /export_runs.json
  def index
    @search = ExportRun.search(params[:q])
    @export_runs  = @search.result.order('started_at DESC').page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        authorize! :read, ExportRun, message: 'Not authorized for API use.'
        render json: @export_runs
      end
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

end
