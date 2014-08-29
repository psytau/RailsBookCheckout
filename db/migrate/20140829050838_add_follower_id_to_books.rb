class AddFollowerIdToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :follower, index: true
  end
end
