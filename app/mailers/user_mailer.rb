class UserMailer < ApplicationMailer
  def welcome_letter
    @user = params[:user]
    attachments.inline['VMC.png'] = File.read(Rails.root.join('app/assets/images/VMC.png'))
    mail(to: @user.email, subject: 'Welcome to VenueMC!')
  end
end
