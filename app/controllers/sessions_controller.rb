class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.google_uid
      flash[:alert] = 'This account was created with Google. Please sign in with Google.'
      redirect_to root_path
    elsif @user && @user.authenticate(params[:password])
      @user.slug ||= SecureRandom.uuid
      @user.save
      session[:slug] = @user.slug
      redirect_to admin_path
    else
      flash[:alert] = 'Invalid email/password.'
      redirect_to root_path
    end
  end

  def destroy
    session.clear if logged_in?
    redirect_to root_path
  end
end
