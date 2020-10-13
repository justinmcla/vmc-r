class OmniauthController < ApplicationController
  def create
    @auth = request.env['omniauth.auth']
    @user = User.find_by(email: @auth[:info][:email])
    if @user
      @user.google_uid ||= @auth[:uid]
      session[:user_id] = @user.id
    else
      @user = User.create(name: @auth[:info][:name], 
                          email: @auth[:info][:email], 
                          google_uid: @auth[:uid], 
                          password: @auth[:uid])
      session[:user_id] = @user.id
    end
      redirect_to admin_path
  end
end