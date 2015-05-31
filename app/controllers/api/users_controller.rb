class Api::UsersController < ApplicationController
  include UsersHelper

  def index
    industry_ids     = JSON.parse(params[:industryIds])
    range            = params[:range].to_i
    serialized_users = ActiveModel::ArraySerializer
         .new(find_users(range, industry_ids), each_serializer: UserSerializer)
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
  end

  def update
    user          = User.find(params[:id])
    user.industry = Industry.find_or_create_by(name: professional_params['industry'])
    user.jobs     = [
      Job.find_or_create_by(company_name: professional_params['company1'], title: professional_params['job1'], user_id: user.id),
      Job.find_or_create_by(company_name: professional_params['company2'], title: professional_params['job2'], user_id: user.id)
    ]
    user.update(user_params)
    message   = user.save ? "/users" : "fail"
    render json: {message: message}
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

  def find_users(range, industries)
    cuser = User.includes(:industry, :friends, :inverse_friends, :jobs).find(session[:user_id])
    users = User.includes(:industry, :friends, :inverse_friends, :jobs).where.not(id: session[:user_id]).where(industry_id: industries).within(range, origin: cuser) - cuser.all_friends - cuser.requests
  end

  def user_params
    params.permit(:golfcourse, :handicap, :rounds_played, :member_at, :favorite_club, :description, :availability, :specialty, :job, :email)
  end

  def professional_params
    params.permit(:industry, :job1, :job2, :company1, :company2)
  end

end