class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :requested_user_id, null: false
      t.integer :requesting_user_id, null: false
    end
  end
end
