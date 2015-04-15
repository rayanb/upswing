class UsersController < ApplicationController

  def index
    render json: "I am a json object that returns all users"
  end

  def show
    render json: "I am a single user"
  end

  def new
    render json: "Linkedin signup all the time"
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      redirect_to user
    else
      user = User.create(email: params[:email])
      redirect_to edit_user_path(user.id)
    end
  end

  def edit
    render json: "Thats where golf info would be added"
  end

  def update
    render json: "Saves in the database all golf info"
  end

  def delete
    render json: "Deleted my record from the database"
  end
end