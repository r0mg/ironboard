class SessionsController < ApplicationController
 
 def create 
  user = User.find_by(:name => params[:name])
  if user && user.authenticate(params[:password]) 
     session[:user_id] = user.id 
     redirect_to user_path(user)
  else 
    flash[:notice] = "Invalid input"
    redirect_to login_path , notice: "Invalid input"
  end
 end


 def new 
  render "login"
 end 


  def destroy
    reset_session
    redirect_to root_path
  end
    
end
