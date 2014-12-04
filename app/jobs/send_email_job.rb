class SendEmailJob
  @queue = :emails

  def self.perform(params)
    email = params["user_email"]
    results = params["results"]
    UserMailer.send_comparison(email, results).deliver
  end
end
