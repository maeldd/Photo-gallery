class UserMailer < ApplicationMailer
  default from: 'dianeetmael@gmail.com'

  def welcome_email(user)
    @user = user
    @url = new_session_url
    mail(to: user.email, subject: 'Bienvenue sur la galerie photo de Diane et Mael')
  end

  def reset_password(user)
    @user = user
    mail(to: user.email, subject: "Changer votre mot de passe pour la galerie photo de Diane et Mael")
  end

end
