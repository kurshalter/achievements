ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.1und1.com',
  :port => 25,
  :domain => "wunschware.de",
  :user_name => 'frank.wunsch@wunschware.de',
  :password => 'wTalisk53',
  :authentication => 'plain',
}
