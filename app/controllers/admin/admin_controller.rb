class Admin::AdminController < ApplicationController
  layout 'admin'
  before_action :auth
  def index
  end
end