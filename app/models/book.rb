class Book < ActiveRecord::Base
  validates :author, :title, presence: true
  has_many :reservations
  has_many :ratings

  def approved
    !approved_at.blank?
  end

  has_attachments :photos, maximum: 1

  # validates :photos, presence: true

  def average_rating
    ratings.where("score != 0").sum("score") / Rating.count
  end

end
