module ApplicationHelper

  private

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def user_signed_in?
    session[:user_id]
  end

  def user_authorized
    if !user_signed_in?
      redirect_to root_path, notice: "Login or sign up first!"
    end
  end

  def permission_to_edit?(user_object)
    current_user == user_object
  end

end
