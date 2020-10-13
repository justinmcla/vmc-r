class OmniauthController < ApplicationController
  def create
    @auth = request.env['omniauth.auth']
    @user = User.find_by(email: @auth[:info][:email])
    if @user
      @user.google_uid ||= @auth[:uid]
      session[:slug] = @user.slug
    else
      @user = User.create(name: @auth[:info][:name], 
                          email: @auth[:info][:email], 
                          google_uid: @auth[:uid], 
                          password: SecureRandom.uuid)
      UserMailer.with(user: @user).welcome_letter.deliver_now
      session[:slug] = @user.slug
    end
      redirect_to admin_path
  end
end