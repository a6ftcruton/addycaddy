Rails.application.routes.draw do
  class AuthConstraint
    def matches?(request)
      request.session["devise.twitter_uid"].present?
    end
  end

  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }
  
  root to: 'comparisons#new', as: :logged_in, contstraints: AuthConstraint.new
  root to: 'sessions#new'
  
  get '/comparisons', to: 'comparisons#show'
end
