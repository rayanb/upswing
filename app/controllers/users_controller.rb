class UsersController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    if User.from_omniauth(env["omniauth.auth"]) == "already"
      render json: "news"
    else
      render json: "edit"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end