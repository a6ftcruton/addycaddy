Rails.application.routes.draw do
#  mount Resque::Server.new, at: "/resque" <-- background workersj

  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }
  
  get '/comparisons/new', to: 'comparisons#new'
  get '/comparisons/show', to: 'comparisons#show'
  root to: 'sessions#new'
end
