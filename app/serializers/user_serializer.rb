class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :job, :location, :industry, :picture_url, :has_liked_current_user
end