class Api::V1::UrlsController < ApplicationController

  def index
    top_100_urls = Url.top_100

    render json: top_100_urls
  end

  def show
    url = Url.find(params[:id])

    if url
      url.increment!(:clicks)
      
      redirect_to url.original
    else
      render json: {error: "Can't locate url"}, status: 400
    end
  end

  def create
    url = Url.new(url_params)
    
    if url.save
      render json: url
    else
      render json: {error: 'Unable to create url'}, status: 404 
    end
  end

  private

  def url_params
    params.require(:url).permit(:original)
  end
end
