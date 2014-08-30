class BookReview < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller.current_user unless controller.admin_user }
  belongs_to :user
  belongs_to :book
end
