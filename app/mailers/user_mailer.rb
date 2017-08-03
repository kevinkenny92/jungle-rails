class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def send_email(user)
    @user = user
    mail(to: @user.email, subject: 'ORDER Number')
  end
end