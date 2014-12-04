class EmailController < ApplicationController

  def send_email
    Resque.enqueue(SendEmailJob, params)
    redirect_to :back
  end
  
end
