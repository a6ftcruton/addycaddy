Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }
  get '/login', to: 'sessions#new'
  root to: 'sessions#new'
end
