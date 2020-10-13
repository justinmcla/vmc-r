class UserMailerPreview < ActionMailer::Preview
    def welcome_letter
        @user = User.first
        UserMailer.with(user: @user).welcome_letter
    end
end