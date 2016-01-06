class UserMailer < ActionMailer::Base
  default from: "rob.ogus@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
            :to => 'rob.ogus@gmail.com',
            :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Rob's Records"
    mail(:to => user.email,
          :subject => "Welcome to #{@appname}!")
  end

end
