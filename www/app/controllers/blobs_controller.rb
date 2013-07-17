class BlobsController < ApplicationController

  def index
    @blobs = Blob.all

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
