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

  # DELETE /data_sources/1
  # DELETE /data_sources/1.json
  def destroy
    authorize! :destroy, ExportRun, message: 'Not authorized as an administrator.'

    @export_run = ExportRun.find(params[:id])
    @export_run.destroy

    respond_to do |format|
      format.html { redirect_to export_runs_url }
      format.json { head :no_content }
    end
  end

end
