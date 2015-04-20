class Api::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    serialized_users =
      ActiveModel::ArraySerializer
        .new(User.all, each_serializer: UserSerializer)
    render json: serialized_users
  end

  def show
    render json: "I am a single user"
  end

  def new
    render json: "Linkedin signup all the time"
  end

  def create
    if User.from_omniauth(env["omniauth.auth"]) == "already"
      render json: "news"
    else
      render json: "edit"
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