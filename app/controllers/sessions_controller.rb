class SessionsController < ApplicationController

  include UsersHelper

  def new
    @user = User.new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @alert = "Incorrect email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
