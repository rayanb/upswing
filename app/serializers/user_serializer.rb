class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :job, :location, :industry, :picture_url
end