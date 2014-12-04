if RAILS.env.production?
 ActionMailer::Base.smtp_settings = {
     :address => "smtp.sendgrid.net",
      :port => 25,
      :domain => "http://192.241.133.37",
      :authentication => :plain,
      :user_name => SENDGRID_USERNAME,
      :password => SENDGRID_PASSWORD
 }
end
  
