class Api::V1::UrlsController < ApplicationController

  def index # TODO Return 100 most frequently accessed urls
    urls = Url.all
    render json: urls
  end

  def create
    url = Url.new(url_params)

    if url.save
      render json: url
    else
      render json: {error: 'Unable to create url'}, status: 400 
    end
  end

  private

  def url_params
    params.require(:url).permit(:original)
  end

end
