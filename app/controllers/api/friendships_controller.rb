class Api::FriendshipsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  include UsersHelper

  def index
    friends = ActiveModel::ArraySerializer
         .new(current_user.friends, each_serializer: UserSerializer)
    render json: {friends: friends, currentUser: serialized_current_user}
  end

  def create
    user_id   = params[:user_id]
    friend_id = params[:friend_id]
    puts FriendRequest.find_by(user_id: user_id, friend_id: friend_id)
    if FriendRequest.find_by(user_id: user_id, friend_id: friend_id)
      Friendship.create(user_id: user_id, friend_id: friend_id)
      render json: 'friendship'
    else
      FriendRequest.create(user_id: user_id, friend_id: params[:friend_id])
      render json: "request"
    end
  end

  def update
  end

  def destroy
  end

end