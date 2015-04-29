class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :job, :location, :industry_id, :picture_url
end