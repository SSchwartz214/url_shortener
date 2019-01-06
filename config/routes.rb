Rails.application.routes.draw do

  get ':short', to: 'short_urls#show'

  namespace :api do
    namespace :v1 do
      root 'urls#index'

      post 'url', to: 'urls#create' 
      get 'top', to: 'urls#index'
      resources :urls, only: [:destroy]
    end
  end
end
