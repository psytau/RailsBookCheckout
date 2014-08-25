class User < ActiveRecord::Base
  has_many :ratings
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	after_create :send_invitation
	  
	  def send_invitation
	  	invite_email = TransactionalMailer.new
	  	trigger = 2
	  	invite_email.user_mailer(2, 2)
	  end
end

