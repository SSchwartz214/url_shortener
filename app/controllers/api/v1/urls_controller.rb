class Api::V1::UrlsController < ApplicationController

  def index # TODO Return 100 most frequently accessed urls
    urls = Url.all
    render json: urls
  end

  def show
    url = Url.find(params[:id])

    if url
      if redirect_to url.original
        url.increment!(:clicks) 
      end
    else
      render 'index'
    end
  end

  def create
    url = Url.new(url_params)

    if url.save
      scraped_title = Scrape.perform(url.original)
      url.update_attributes(title: scraped_title)
      
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
