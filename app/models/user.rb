class User < ActiveRecord::Base

  attr_accessor :has_liked_current_user

  belongs_to :industry
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def self.exists?(email)
    if User.find_by(email: email)
      return "already"
    else
      return "new user"
    end
  end

  def self.from_omniauth(auth)
    puts auth
    message = User.exists?(auth.info.email)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider    = auth.provider
      user.uid         = auth.uid
      user.name        = auth.info.name
      user.email       = auth.info.email
      user.location    = auth.info.location.name
      user.picture_url = auth.info.image
      user.industry    = Industry.find_or_create_by(name: auth.extra.raw_info.industry)
      user.job         = auth.extra.raw_info.headline
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
      @current_user = user
    end
    return {message: message, user: @current_user}
  end

  def has_liked_current_user?(current)
    if FriendRequest.find_by(user_id: id, friend_id: current)
      true
    else
      false
    end
  end

end
