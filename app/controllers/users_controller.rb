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
    existing_user = User.find_by(email: params[:email])
    if existing_user
      render json: "redirect to news feed"
    else
      user = User.create(email: params[:email])
      puts "redirect to edit_user_path(user.id)"
      render json: "redirect to edit page"
    end
  end

  def edit
    render json: "Thats where golf info would be added"
  end

  def update
    render json: "Saves in the database all golf info"
  end

  def destroy
    render json: "destroyed the user"
  end
end