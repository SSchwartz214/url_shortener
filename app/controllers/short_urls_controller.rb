class ShortUrlsController < ApplicationController

  def show
    url = Url.find_by(short: params[:short])

    if url
      url.increment!(:clicks)
      
      redirect_to url.original
    else
      render json: {error: "Short url does not exist"}, status: 400
    end
  end
end