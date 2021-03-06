class User < ActiveRecord::Base
  extend Rolify::Dynamic
  has_many :ratings
  has_many :books
  has_many :book_reviews
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :invitable  # needed for invites


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
      ratings.where('score > 0').average(:score)
    else
      'No ratings'
    end
  end

  # This is required to make travis pass
  # see https://github.com/RolifyCommunity/rolify/issues/28
  def is_admin?
    has_role? :admin
  end

end
