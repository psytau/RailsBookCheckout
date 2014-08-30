class Rating < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller.current_user unless controller.admin_user }
  belongs_to :book
  belongs_to :user
  # after_save :email_followers

  def user_rating book, user
    Rating.where("book_id = ? AND user_id = ?", book.id, user.id).first.score unless Rating.where("book_id = ? AND user_id = ?", book.id, user.id).empty?
  end
end
