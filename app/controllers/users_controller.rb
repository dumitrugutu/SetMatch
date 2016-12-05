class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :authorized_user, only: [:edit, :update]

  def index
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to the SetMatch App!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Profile updated successfully."
      redirect_to(user_path(@user))
    else
      render('edit')
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :email,
        :fullname,
        :screen_name,
        :password,
        :bio,
        :rating,
        :zipcode,
        :age,
        :gender,
        :handed,
        :image )
    end

    def logged_in_user
      unless logged_in?
        flash[:notice] = "Wow! You\'re not even logged in."
        redirect_to(login_path)
      end
    end

    # Confirms the correct user
    def authorized_user
      @user = User.find(params[:id])
      flash[:notice] = "You\'re not allowed to do that."
      redirect_to(root_path) unless current_user?(@user)
    end
end
