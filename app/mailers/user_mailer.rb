class UserMailer < ActionMailer::Base

  def welcome user_id
    user = User.find user_id
    mail(to: user.email, subject: "Welcome #{user.firstname}!")
  end

  def invite to_name, email, from_id, is_admin=false
    @from_user = User.find from_id
    @name = to_name
    @invite_location = 'http://railsbookcheckout.herokuapp.com/users/sign_up'
    mail(to:email, subject: "#{@from_user.firstname} has invited you to use RailsBookCheckout")
  end
end
