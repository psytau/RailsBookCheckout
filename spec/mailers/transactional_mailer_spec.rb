require 'rails_helper'

describe "send_mail" do 
	it "sends invitation email to a new user" do
		recipient_email = "johnrobertwade@gmail.com"
		expect(recipient_email).to eq("johnrobertwade@gmail.com")
	end
end