class WelcomeController < ApplicationController

  def index
    if session[:user_id]
      redirect_to users_path
    end
  end

end
