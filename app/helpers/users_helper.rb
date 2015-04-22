module UsersHelper

  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return nil
    end
  end

  def serialized_current_user
    user = User.find_by(id: session[:user_id])
    if user
      UserSerializer.new(user).serializable_hash
    else
      nil
    end
  end

end
