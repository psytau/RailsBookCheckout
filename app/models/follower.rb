class Follower < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller.current_user if (!!controller && !controller.admin_user) }

  has_one :book
  has_one :user

end
