class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear if logged_in?
    redirect_to root_path
  end
end
