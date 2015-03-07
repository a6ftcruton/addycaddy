Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }
  
  get '/comparisons/new', to: 'comparisons#new'
  get '/comparisons/show', to: 'comparisons#show'

  scope '/comparisons' do
    resources :maps, only: [:index]
  end

  root to: 'sessions#new'

  get '/how-it-works', to: 'about#show' 
  get '/api-info', to: 'about#api_info' 

  post '/send-email', to: 'email#send_email'
    
  namespace :api do
    namespace :v1 do
      resources :comparisons, only: [:index]
    end
  end

end
