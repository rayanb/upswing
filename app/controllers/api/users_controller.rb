class Api::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    serialized_users =
      ActiveModel::ArraySerializer
        .new(User.all, each_serializer: UserSerializer)
    render json: {users: serialized_users, currentUser: session[:user_id]}
  end

  def show
    serialized_user =
      UserSerializer
        .new(User.find(params[:id]))
    render json: {users: serialized_user, currentUser: session[:user_id]}
  end

  def new
    render json: "Linkedin signup all the time"
  end

  def create
    user_creation     = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user_creation[:user].id
    if user_creation[:message] == "already"
      redirect_to '/'
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