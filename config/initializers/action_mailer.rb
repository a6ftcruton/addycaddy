if Rails.env.production?
 ActionMailer::Base.smtp_settings = {
     :address => "smtp.sendgrid.net",
      :port => 25,
      :domain => "http://192.241.133.37",
      :authentication => :plain,
      :user_name => ENV['SENDGRID_USERNAME'],
      :password => ENV['SENDGRID_PASSWORD']
 }
end
  
