class Api::ExportRecordsController < RocketPants::Base

  include Devise::Controllers::Helpers
  include CanCan::ControllerAdditions

  before_filter :authenticate_user!

  map_error! CanCan::AccessDenied, RocketPants::Forbidden

  def index
    authorize! :read, ExportRecord, message: 'Not authorized for API use.'

    @search = ExportRecord.search(params[:q])
    expose @search.result.order('created_at DESC').page params[:page]
  end

  def show
    authorize! :read, ExportRecord, message: 'Not authorized for API use.'

    expose ExportRecord.find(params[:id])
  end

  def create
    authorize! :create, ExportRecord, message: 'Not authorized as an administrator.'

    expose ExportRecord.create!(params[:export_record]), status: :created
  end

end
