class Api::ExportRunsController < RocketPants::Base

  include Devise::Controllers::Helpers
  include CanCan::ControllerAdditions

  before_filter :authenticate_user!

  map_error! CanCan::AccessDenied, RocketPants::Forbidden

  def index
    authorize! :read, ExportRun, message: 'Not authorized for API use.'

    @search = ExportRun.search(params[:q])
    expose @search.result.order('created_at DESC').page params[:page]
  end

  def show
    authorize! :read, ExportRun, message: 'Not authorized for API use.'

    expose ExportRun.find(params[:id])
  end

  def create
    authorize! :create, ExportRun, message: 'Not authorized as an administrator.'

    expose ExportRun.create!(params[:export_run]), status: :created
  end

  def update
    authorize! :update, ExportRun, message: 'Not authorized as an administrator.'

    @export_run = ExportRun.find(params[:id])

    @export_run.update_attributes(params[:export_run])

    if (@export_run.errors.count > 0) then
      error! :forbidden
    else
      expose @export_run
    end

  end

end
