class Api::V1::UrlsController < ApplicationController

  def index
    top_100_urls = Url.top_100

    render json: top_100_urls
  end

  def create
    url = Url.new(url_params)
    
    if url.save
      render json: url
    else
      render json: {error: url.errors}, status: 404
    end
  end

  def destroy
    url = Url.find(params[:id])

    if url.destroy
      render json: {
        message: "Successfully removed #{url.original}"
      }
    else
      render json: {error: url.errors}, status: :unprocessable_entity
    end
  end

  private

  def url_params
    params.require(:url).permit(:original)
  end
end
