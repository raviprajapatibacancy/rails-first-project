class UserMailer < ApplicationMailer
  default from: 'ravi.prajapati@bacancy.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: 'raviprajapati2505@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
