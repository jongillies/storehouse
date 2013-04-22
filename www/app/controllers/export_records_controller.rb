class ExportRecordsController < ApplicationController
  # GET /export_records
  # GET /export_records.json
  def index
    @search = ExportRecord.search(params[:q])
    @export_records  = @search.result.order(:created_at).page params[:page]

    @export_run = ExportRun.find_by_id(params[:export_run_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @export_records }
    end
  end

  # GET /export_records/1
  # GET /export_records/1.json
  def show
    @export_record = ExportRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @export_record }
    end
  end

  # POST /export_records
  # POST /export_records.json
  def create
    @export_record = ExportRecord.new(params[:export_record])

    respond_to do |format|
      if @export_record.save
        format.html { redirect_to @export_record, notice: 'Export set was successfully created.' }
        format.json { render json: @export_record, status: :created, location: @export_record }
      else
        format.html { render action: "new" }
        format.json { render json: @export_record.errors, status: :unprocessable_entity }
      end
    end
  end

end
