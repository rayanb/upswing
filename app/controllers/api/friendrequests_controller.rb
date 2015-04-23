class Api::FriendrequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    user_id   = params[:user_id].to_i
    friend_id = params[:friend_id].to_i
    FriendRequest.create(user_id: user_id, friend_id: params[:friend_id])
    render json: "friend request created"
  end

  def update
  end

  def destroy
  end

end