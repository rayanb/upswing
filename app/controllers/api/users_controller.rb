class Api::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  include UsersHelper

  def index
    industry_ids = JSON.parse(params[:industryIds])
    serialized_users =
      ActiveModel::ArraySerializer
        .new(User.where(industry_id: industry_ids), each_serializer: UserSerializer)
    render json: {users: serialized_users, currentUser: serialized_current_user}
  end

  def show
    serialized_user =
      UserSerializer
        .new(User.find(params[:id])).serializable_hash
    render json: {user: serialized_user, currentUser: serialized_current_user}
  end

  def new
    render json: "Linkedin signup all the time"
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

  def edit
    render json: "Thats where golf info would be added"
  end

  def update
    render json: "Saves in the database all golf info"
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end