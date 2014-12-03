Rails.application.routes.draw do
#  mount Resque::Server.new, at: "/resque" <-- background workersj

  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }
  
  get '/comparisons/new', to: 'comparisons#new'
  get '/comparisons/show', to: 'comparisons#show'
  root to: 'sessions#new'

  get '/how-it-works', to: 'about#show' 
  get '/api-info', to: 'about#api_info' 
    
  namespace :api do
    namespace :v1 do
      resources :comparisons, only: [:index]
    end
  end

end
