class User < ActiveRecord::Base
  has_many :ratings
  has_many :books
  has_many :book_reviews
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # stats for users
  def total_logins
    # logins
    3
  end

  def book_reviews_count
    book_reviews.count
  end

  def books_count
    books.count
  end

  def ratings_ave
    if ratings.count > 0
      ratings.average(:score)
    else
      'No ratings'
    end
  end

end
