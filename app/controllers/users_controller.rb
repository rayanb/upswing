class UsersController < ApplicationController

  def index
    render json: "I am a json object that returns all users"
  end

  def show
    render json: "I am a single user"
  end

  def new
    render json: "Linkedin signup all the time, if first time redirect to "
  end

  def create
    render json: "Should do some operation on the backend to process linkedin"
  end

  def edit
    render json: "Thats where golf info would be added"
  end

  def update
  end

  def delete
  end
end