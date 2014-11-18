Rails.application.routes.draw do

  devise_for :users
  get '/login', to: 'sessions#new'
  root to: 'sessions#new'
end
