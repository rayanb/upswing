class Api::FriendshipsController < ApplicationController
  include UsersHelper

  def index
    user = User.includes(:friends, :inverse_friends).find(params[:user_id])
    friends = ActiveModel::ArraySerializer
         .new(user.all_friends, each_serializer: UserSerializer)
    render json: {friends: friends}
  end

  def create
    user_id   = params[:user_id]
    friend_id = params[:friend_id]
    if FriendRequest.find_by(user_id: friend_id, friend_id: user_id)
      Friendship.create(user_id: user_id, friend_id: friend_id)
      render json: {status: 'friendship'}
    else
      FriendRequest.create(user_id: user_id, friend_id: friend_id)
      render json: {status: "request"}
    end
  end

  def update
  end

  def destroy
  end

end