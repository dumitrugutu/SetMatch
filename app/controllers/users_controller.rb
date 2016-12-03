class UsersController < ApplicationController

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
end
