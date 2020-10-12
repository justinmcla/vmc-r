class ApplicationController < ActionController::Base
  def logged_in?
    !!session[:user_id]
  end

  def auth
    redirect_to root_path unless logged_in?
  end

  def current_user
    User.find_by_id(session[:user_id])
  end
end
