class ExportRunsController < ApplicationController

  def index
    @search = ExportRun.search(params[:q])
    @export_runs  = @search.result.order('started_at DESC').page params[:page]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @export_run = ExportRun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def destroy
    authorize! :destroy, ExportRun, message: 'Not authorized as an administrator.'

    @export_run = ExportRun.find(params[:id])
    @export_run.destroy

    respond_to do |format|
      format.html { redirect_to export_runs_url }
    end
  end

end
