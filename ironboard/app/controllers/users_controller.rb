class UsersController < ApplicationController

  def index
    @users = User.all
    @users = @users.sort_by { |user| user.name }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.img_url =  "board#{rand(1..10)}.jpeg"
    @user.build_host
    @user.build_guest
    @user.name = @user.name.capitalize
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    # @user = @user.guest.sort_by_day
    # @user.guest.events = @user.guest.events.sort_by { |event| event.day }
    # binding.pry
    # @user.host.events
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  private


  def user_params
    params.require(:user).permit(:name, :bio, :location, :password, :password_confirmation)
  end
  
end
