OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin,  ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'], :scope => 'r_emailaddress r_basicprofile'
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end