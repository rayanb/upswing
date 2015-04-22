class FriendRequest < ActiveRecord::Base
  belongs_to :user, foreign_key: :requesting_user_id
  belongs_to :friend, foreign_key: :requested_user_id, class_name: "User"
end