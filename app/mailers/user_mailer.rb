class UserMailer < ApplicationMailer
  default from: "taskcraftteamtest@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Task Academy!')
  end
end
