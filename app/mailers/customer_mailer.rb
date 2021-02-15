class CustomerMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.destroy.subject
  #
  default from: 'Tate Wine Order <noreply@wineorders.com>'
  def destroy(customer)
    puts "Sending email???"
    email = params[:email]
    @customer = customer
    mail(to: email, subject: 'New DB destroyed')
    # end
  end
end
