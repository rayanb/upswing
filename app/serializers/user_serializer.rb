class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :job, :location_city, :location_state, :location_longitude, :location_latitude, :industry_id, :picture_url
end