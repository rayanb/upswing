class User < ActiveRecord::Base

  def self.exists?(email)
    if User.find_by(email: email)
      return "already"
    else
      return "new user"
    end
  end

  def self.from_omniauth(auth)
    message = User.exists?(auth.info.email)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider    = auth.provider
      user.uid         = auth.uid
      user.name        = auth.info.name
      user.email       = auth.info.email
      user.location    = auth.info.location.name
      user.picture_url = auth.info.image
      user.industry    = auth.extra.raw_info.industry
      user.job         = auth.extra.raw_info.headline
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
    return message
  end

end
