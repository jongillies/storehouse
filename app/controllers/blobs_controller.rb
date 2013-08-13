class BlobsController < ApplicationController

  def index
    @search = Blob.search(params[:q])
    @blobs  = @search.result.order('created_at DESC').page params[:page]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @blob = Blob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
