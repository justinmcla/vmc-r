class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @user.slug ||= SecureRandom.uuid
      @user.save
      session[:slug] = @user.slug
      redirect_to admin_path
    elsif @user && @user.google_uid
      flash[:error] = 'This account was created with Google. Please sign in with Google.'
      redirect_to root_path
    else
      flash[:error] = 'Invalid email/password.'
      redirect_to root_path
    end
  end

  def destroy
    session.clear if logged_in?
    redirect_to root_path
  end
end
