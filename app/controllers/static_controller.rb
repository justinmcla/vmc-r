class StaticController < ApplicationController
  def index
    redirect_to admin_path if logged_in?
    @user = User.new
  end
end
