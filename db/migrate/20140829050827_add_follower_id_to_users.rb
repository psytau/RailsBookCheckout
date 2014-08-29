class AddFollowerIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :follower, index: true
  end
end
