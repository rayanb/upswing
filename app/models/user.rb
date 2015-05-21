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
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key =>"friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :friend_requests
  has_many :requests, :through => :friend_requests, source: :friend
  has_many :jobs

  def self.exists?(uid)
    if User.find_by(uid: uid)
      return "already"
    else
      return "new user"
    end
  end

  def all_friends
    friends + inverse_friends
  end

  def self.from_omniauth(auth)
    puts "HEEERE"
    message = User.exists?(auth.uid)
    where(provider: auth.provider, uid: auth.uid)
    .first_or_initialize.tap do |user|
      user.provider    = auth.provider
      user.uid         = auth.uid
      user.name        = auth.info.name
      user.email       = auth.info.email if auth.info.email
      user.picture_url = auth.info.image
      if auth.info.location && auth.info.location.is_a?(Hash)
        user.location_city    = auth.info.location.name
      elsif auth.info.location
        user.location_city    = auth.info.location
      end
      if auth.extra
        if auth.extra.raw_info && auth.extra.raw_info.industry
          user.industry    = Industry.find_or_create_by(name: auth.extra.raw_info.industry)
        end
        if auth.extra.raw_info && auth.extra.raw_info.headline
          user.job         = auth.extra.raw_info.headline
        end
      else
        user.provider == "facebook"
      end
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
      @current_user = user
    end
    if @current_user.provider == "linkedin"
      @current_user.sync_full_profile
    elsif @current_user.provider == "facebook"
    end
    return {message: message, user: @current_user}
  end

  def locate(ip_address)
    location = IpGeocoder.geocode(ip_address)
    update_attributes(location_city: location.city, location_state: location.state, location_longitude: location.longitude.to_f, location_latitude: location.latitude.to_f)
    self.save
  end

  def sync_full_profile
    api          = LinkedIn::API.new(oauth_token)
    full_profile =  api.profile(fields: ["id", {"positions" => ["title", "company"]}, "specialties", "summary"])
    positions    = full_profile.positions.all.take(2) if full_profile.positions.all
    if positions && positions.length > 0
      positions.map{|position|  Job.find_or_create_by(company_name: position.company.name, title: position.title, user_id: id)}
    end
    if full_profile.specialties
      self.specialty =  full_profile.specialties
    elsif full_profile.summary
      short_summary = "#{full_profile.summary.split(" ").first(30).join(" ")} ..."
      self.specialty =  short_summary
    else
      self.specialty = "No Specialties described by the user"
    end
    save!
  end

end
