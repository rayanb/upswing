class Api::UsersController < ApplicationController
  include UsersHelper

  def index
    industry_ids     = JSON.parse(params[:industryIds])
    range            = params[:range].to_i
    serialized_users = ActiveModel::ArraySerializer
         .new(users(range, industry_ids), each_serializer: UserSerializer)
    render json: {users: serialized_users, currentUser: serialized_current_user}
  end

  def current
    render json: serialized_current_user
  end

  def locate
    user = User.find(session[:user_id])
    ip = params[:ip_address]
    user.locate(ip)
    render json: {hey: ip}
  end

  def show
    render json: "hey"
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

  private

  def users(range, industries)
    cuser = User.includes(:industry, :friends, :inverse_friends).find(session[:user_id])
    users = User.where.not(id: session[:user_id]).where(industry_id: industries).within(range, origin: cuser) - cuser.all_friends - cuser.requests
  end

end