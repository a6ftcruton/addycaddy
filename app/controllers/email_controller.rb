class EmailController < ApplicationController

  def send_email
#    @user_email = params["user_email"]
#    @results = params["results"]
    Resque.enqueue(SendEmailJob, params)
    redirect_to :back
  end
end
