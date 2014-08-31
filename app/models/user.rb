class User < ActiveRecord::Base
  has_many :ratings
  has_many :books
  has_many :book_reviews
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	after_create :send_invitation
	  
	  def send_invitation
	  	invite_email = TransactionalMailer.new
	  	trigger = 2
	  	invite_email.user_mailer(id, 2)
	  end

  # stats for users
  def total_logins
    # logins
    sign_in_counter
  end

  def book_reviews_count
    PublicActivity::Activity.where(owner_id: id, key: 'book_review.create').count
  end

  def books_count
    PublicActivity::Activity.where(owner_id: id, key: 'book.create').count
  end

  def ratings_ave
    # need to make it so admins' actions do not affect this score.
    if ratings.count > 0
      ratings.average(:score)
    else
      'No ratings'
    end
  end

end

