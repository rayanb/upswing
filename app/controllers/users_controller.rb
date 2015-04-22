class UsersController < ApplicationController

  def index
  end

  def show
  end

  def create
    user_creation     = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user_creation[:user].id
    if user_creation[:message] == "already"
      redirect_to users_path
    else
      redirect_to edit_user_path(session[:user_id])
    end
  end

  def new
  end

  def edit
  end



end