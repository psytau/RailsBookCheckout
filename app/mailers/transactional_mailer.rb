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
end