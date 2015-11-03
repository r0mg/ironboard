class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?, :user_authorized

  def root
  	render 'layouts/index'
  end

  
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

end
