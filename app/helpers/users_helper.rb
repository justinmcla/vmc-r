module UsersHelper
    def current_user
        User.find_by(slug: session[:slug])
    end
end
