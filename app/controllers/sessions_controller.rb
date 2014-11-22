class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to new_comparison_path 
    else
      render 'new'
    end
  end
end
