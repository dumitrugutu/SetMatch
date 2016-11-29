class SessionsController < ApplicationController

  def new
    @user = User.new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      flash[:notice] = "You have signed in successfully!"
      redirect_to user_path(@user)
    else
      @alert = "Incorrect email or password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
