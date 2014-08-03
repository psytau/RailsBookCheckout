class Book < ActiveRecord::Base
  validates :author, :title, presence: true
  has_many :reservation

  def approved
    !approved_at.blank?
  end
end
