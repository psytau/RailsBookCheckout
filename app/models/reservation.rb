class Reservation < ActiveRecord::Base
  validates :book_id, :user_id, :reserved_date, :return_date, presence: true
  belongs_to :user
  belongs_to :book
end
