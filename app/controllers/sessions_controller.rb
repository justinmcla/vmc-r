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

  def omniauth
    @auth = request.env['omniauth.auth']
    @user = User.find_by(email: @auth[:info][:email])
    if @user
      @user.google_uid ||= @auth[:uid]
      session[:user_id] = @user.id
    else
      @user = User.create(name: @auth[:info], email: @auth[:info][:email], google_uid: @auth[:uid], password: @auth[:uid])
      session[:user_id] = @user.id
    end
    redirect_to home_path
  end

  def destroy
    session.clear if logged_in?
    redirect_to root_path
  end
end
