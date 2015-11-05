class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  
  protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?, :user_authorized, :permission_to_edit?

  def root
  	if current_user
  		@user = current_user
  		render 'users/show'
  	else
  		@events = Event.all
  		render 'events/index'
  	end
  end

end
