class BookReview < ActiveRecord::Base
  include PublicActivity::Model
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  tracked owner: ->(controller, model) { controller.current_user if (!!controller && !controller.admin_user) }
  belongs_to :user
  belongs_to :book
end
