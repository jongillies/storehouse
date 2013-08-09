class BlobsController < ApplicationController

  def index
    @search = Blob.search(params[:q])
    @blobs  = @search.result.order('created_at DESC').page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        authorize! :read, Blob, message: 'Not authorized for API use.'
        render json: @blobs
      end
    end
  end

  def show
    @blob = Blob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json do
        authorize! :read, Blob, message: 'Not authorized for API use.'
        render json: @blob
      end
    end
  end

end
