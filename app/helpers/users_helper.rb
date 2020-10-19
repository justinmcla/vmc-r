module UsersHelper
    
  def current_user
    User.find_by(slug: session[:slug])
  end

  def display_settings
    html = <<~HTML
      <p>Name: #{current_user.name}</p>
      <p>Email: #{current_user.email}</p>
      <p>Member Since: #{current_user.created_at.strftime('%B %Y')}</p>
    HTML

    html.html_safe
  end
  
end