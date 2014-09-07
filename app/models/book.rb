require 'elasticsearch/model'
class Book < ActiveRecord::Base
  include PublicActivity::Model
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name = BONSAI_INDEX_NAME
  tracked owner: ->(controller, model) { controller.current_user if (!!controller && !controller.admin_user) }
  # searchable do
  #     text :author, :title, :isbn, :tags, :rating, :review
  # end
  validates :author, :title, presence: true
  has_many :reservations
  has_many :ratings
  belongs_to :user
  has_many :book_reviews
  has_many :followers
  attr_accessor :rating
  scope :active_books, -> {where(active: true)}
  scope :active_or_mine, ->(user_id) {where("active = ? OR user_id = ?", true, user_id)}

  def approved
    !approved_at.blank?
  end

  has_attachments :photos, maximum: 1

  # validates :photos, presence: true

  def self.sorted_by_rating
    Book.all.sort_by(&:rating)
  end

  def rating
    if ! @rating_val
      count = ratings.where("score != 0").count # count ratings for this book
      if count > 0
        sum_of_ratings = ratings.where("score != 0").sum("score")
        @rating_val = sum_of_ratings/count
      else
        @rating_val = 0
      end
    end
    @rating_val
  end

  def deleteable
    # a book is deleteable if it has no reviews, and no one has rated it
    # Since we create a rating with 0 for users who view a page, even if
    # that user has not rated, we need to exclude 0 ratings.
    if book_reviews.count == 0 && ( ratings.where('score != 0').count == 0 )
      true
    else
      false
    end
  end

  def followed? user
    Follower.where("user_id = ? and book_id = ?", user.id, self.id).length  > 0 ? true : false
  end

end
