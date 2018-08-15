class TinymceAssetsController < ApplicationController
  def create
    file = params[:file]
    uploader = EditerUploader.new

    uploader.store!(file)
    render json: {
      image: {
        url: uploader.url
      }
    }, content_type: "text/html"
  end
end
