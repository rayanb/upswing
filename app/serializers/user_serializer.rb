class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :job, :location_city, :location_state, :location_longitude, :location_latitude, :industry, :picture_url, :specialty, :jobs, :handicap, :golfcourse, :golf_associations, :rounds_played, :member_at, :favorite_club, :availability, :provider
end