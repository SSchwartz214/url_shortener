class Api::V1::UrlsController < ApplicationController

  def index
    top_100_urls = Url.top_100

    render json: top_100_urls
  end

  # def show
  #   url = Url.find_by(short: params[:short])

  #   if url
  #     url.increment!(:clicks)
      
  #     redirect_to url.original
  #   else
  #     render json: {error: "Short url does not exist"}, status: 400
  #   end
  # end

  def create
    url = Url.new(url_params)
    
    if url.save
      render json: url
    else
      render json: url.errors
    end
  end

  private

  def url_params
    params.require(:url).permit(:original)
  end
end
