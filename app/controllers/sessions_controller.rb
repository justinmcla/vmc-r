class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.google_uid
      redirect_to root_path, alert: 'This account was created with Google. Please sign in with Google.'
    elsif @user && @user.authenticate(params[:password])
      session[:slug] = @user.slug
      redirect_to admin_path
    else
      redirect_to root_path, alert: 'Invalid email/password.'
    end
  end

  def destroy
    session.clear if logged_in?
    redirect_to root_path
  end
end
