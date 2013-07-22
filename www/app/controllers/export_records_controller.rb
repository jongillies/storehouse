class ExportRecordsController < ApplicationController
  # GET /export_records
  # GET /export_records.json
  def index
    @search = ExportRecord.search(params[:q])
    @export_records  = @search.result.order(:created_at).page params[:page]

    @export_run = ExportRun.find_by_id(params[:export_run_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        authorize! :read, ExportRecord, message: 'Not authorized for API use.'
        render json: @export_records
      end
    end
  end

  # GET /export_records/1
  # GET /export_records/1.json
  def show
    @export_record = ExportRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json do
        authorize! :read, ExportRecord, message: 'Not authorized for API use.'
        render json: @export_record
      end
    end
  end

  # POST /export_records
  # POST /export_records.json
  def create

    export_record = params[:export_record]

    if Blob.exists? export_record['checksum']
      export_record.delete 'blob_attributes'
    end

    @export_record = ExportRecord.new(export_record)

    authorize! :create, ExportRecord, message: 'Not authorized as an administrator.'

    respond_to do |format|
      if @export_record.save
        format.json { render json: @export_record, status: :created, location: @export_record }
      else
        format.json { render json: @export_record.errors, status: :unprocessable_entity }
      end
    end
  end

end
