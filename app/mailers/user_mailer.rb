class UserMailer < ActionMailer::Base

  def welcome user_id
    user = User.find user_id
    mail(to: user.email, subject: "Welcome #{user.firstname}!")
  end

  def invite email, from_id, is_admin=false
    from_user = User.find from_id
    invite_location = 'http://localhost:3000/users/sign_up'
    mail(to:email, subject: "#{from_user.firstname} has invited you to use RailsBookCheckout")
  end
end
