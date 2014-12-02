class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    unless current_user
      flash[:notice] = "You must sign in with Twitter to access this site."
      redirect_to root_path
    end
  end
end
