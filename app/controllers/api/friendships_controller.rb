class Api::FriendshipsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    user_id   = params[:user_id]
    friend_id = params[:friend_id]
    Friendship.create(user_id: user_id, friend_id: friend_id)
    render json: "friendship created"
  end

  def update
  end

  def destroy
  end

end