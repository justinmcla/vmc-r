class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      UserMailer.with(user: @user).welcome_letter.deliver_now
      session[:slug] = @user.slug
      redirect_to admin_path
    else
      redirect_to root_path, alert: @user.errors.to_a
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
