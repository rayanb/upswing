include Geokit::Geocoders
class User < ActiveRecord::Base
  # For geolocalisation
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :location_latitude,
                   :lng_column_name => :location_longitude

  belongs_to :industry
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :friend_requests
  has_many :requests, :through => :friend_requests, source: :friend

  def self.exists?(email)
    if User.find_by(email: email)
      return "already"
    else
      return "new user"
    end
  end

  def all_friends
    friends + inverse_friends
  end

  def self.from_omniauth(auth)
    puts auth.inspect
    message = User.exists?(auth.info.email)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider    = auth.provider
      user.uid         = auth.uid
      user.name        = auth.info.name
      user.email       = auth.info.email
      user.location_city    = auth.info.location.name
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

  def locate(ip_address)
    location = IpGeocoder.geocode(ip_address)
    puts location
    update_attributes(location_city: location.city, location_state: location.state, location_longitude: location.longitude.to_f, location_latitude: location.latitude.to_f)
    self.save
  end

end
