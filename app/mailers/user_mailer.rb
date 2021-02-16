class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_order.subject
  #
  default from: 'Tate Wine Order <noreply@wineorders.com>'
  def new_order(current_user, base_url)
    puts "Sending email"

    @user = params[:user]
    @current_user = current_user
    @link = base_url

    mail(
      to: @user.email,
      subject: 'New Orders')
  end
end
