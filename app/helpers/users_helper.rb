module UsersHelper

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def serialized_current_user
    user = User.includes(:jobs).find_by(id: session[:user_id])
    UserSerializer.new(user).serializable_hash if user
  end

  def not_edit_page?
    params[:action] != "edit"
  end

end
