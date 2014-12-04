require 'resque'

class UserMailer < ActionMailer::Base
  default from: "jgoulding2@gmail.com"

  def send_comparison(email, results)
    Rails.logger.info("************* RESQUE ***********")
    @email = email
    @results = results
      mail( :to => @email,
            :subject => "sending email from resque job"
          )
  end
end
