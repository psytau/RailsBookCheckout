require 'mandrill'

class TransactionalMailer 

  def send_mail ( recipient_email, trigger_id )

    trigger_event = TriggerEvent.find_by(id: trigger_id)

    m = Mandrill::API.new ENV['MANDRILL_APIKEY']

    message = { 
    :subject=> trigger_event.subject, 
    :from_name=> "Ruby Book Checkout",
    :from_email=>"services@rubybookcheckout.com",
    :to=>[
    {:email => recipient_email }
    ], 
    :text=> trigger_event.text
    } 

    sending = m.messages.send message
  end


  def user_mailer ( user_email, trigger_id )
    puts user_email
    user = User.find_by(id: user_email)
    if trigger_id == 2 
      if user.review_email && user.daily_summary == false
        self.send_mail(user.email, trigger_id)
      elsif user.review_email && user.daily_summary 
        @user.incriment!(:review_email_summary)
      end
    elsif trigger_id == 3
      if user.rate_email && user.daily_summary == false
        self.send_mail(user.email, trigger_id)
      elsif user.rate_email  && user.daily_summary 
        @user.increment!(:rate_email_summary)
      end
    else 
      self.send_mail(user.email, trigger_id)      
    end
  end
end