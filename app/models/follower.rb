class Follower < ActiveRecord::Base

  has_one :book
  has_one :user

end
