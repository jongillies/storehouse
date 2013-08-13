class ExportRecordsController < ApplicationController

  def index
    @search = ExportRecord.search(params[:q])
    @export_records  = @search.result.order('created_at DESC').page params[:page]

    @export_run = ExportRun.find_by_id(params[:export_run_id])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @export_record = ExportRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
