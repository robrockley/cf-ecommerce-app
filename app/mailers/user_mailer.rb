class UserMailer < ActionMailer::Base
  default from: "rob.ogus@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
            :to => 'rob.ogus@gmail.com',
            :subject => "A new contact form message from #{name}")
  end

end
