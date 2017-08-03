class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def send_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end