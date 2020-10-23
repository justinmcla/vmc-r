class Admin::AdminController < ApplicationController
  layout 'admin'
  before_action :auth
  
  def index
  end
  
  def show
  end

  #Saves an ActiveRecord object to the database and provides default notice, alert messages
  def resource_save(resource, success_path, failure_path)
    if resource.save
      redirect_to success_path, notice: "#{resource.class.name} saved successfully!"
    else
      redirect_to failure_path, alert: resource.errors.full_messages
    end
  end

end