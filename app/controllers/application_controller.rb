class ApplicationController < ActionController::Base
  def logged_in?
    !!session[:slug]
  end

  def auth
    redirect_to root_path unless logged_in?
  end

  def current_user
    User.find_by(slug: session[:slug])
  end
end
