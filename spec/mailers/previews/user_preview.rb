# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user/welcome_letter
  def welcome_letter
    UserMailer.welcome_letter
  end

end
