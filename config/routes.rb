Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      post 'url', to: 'urls#create' 
      get 'top', to: 'urls#index'
      get ':short', to: 'urls#show'
    end
  end
end
