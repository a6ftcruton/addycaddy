require 'resque'

class UserMailer < ActionMailer::Base
  default from: "jgoulding2@gmail.com"

  def send_comparison(email, results)
    @email = email
    @results = results
      mail( :to => @email,
            :subject => "AddyCaddy: Your recent results."
          )
  end
end
