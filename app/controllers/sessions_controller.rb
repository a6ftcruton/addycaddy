class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to comparisons_new_path 
    else
      render 'new'
    end
  end
end
