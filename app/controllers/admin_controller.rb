class AdminController < ApplicationController
    layout 'admin'
    before_action :auth
    def home
    end
end