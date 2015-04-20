class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :job, :location, :industry
end