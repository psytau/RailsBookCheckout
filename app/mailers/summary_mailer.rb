require 'mandrill'

def summary_mailer
	users = User.where(daily_summary: true)
		users.each do |variable|
			# cycle through rate & review summaries to see if either is > 0
			if user.rate_email_summary > 0 || user.review_email_summary > 0
				# create string email

				email_text = 	"You have had " + user.rate_email_summary + " books rated and " + user.review_email_summary + 
								" books reviewed today. Please, login to see what people have to say!"
				# place values in email
				m = Mandrill::API.new ENV['MANDRILL_APIKEY']

				message = { 
				:subject=> "Rated and Reviewed Books on RailsBookCheckout", 
				:from_name=> "RailsBookCheckout",
				:from_email=>"services@railsbookcheckout.com",
				:to=>[
				{:email => user.email}
				], 
				:text=> email_text
				} 
				sending = m.messages.send message

				user.rate_email_summary = 0
				user.review_email_summary = 0
				user.save
			end
end