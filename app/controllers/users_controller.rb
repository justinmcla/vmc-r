class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to static_test_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
