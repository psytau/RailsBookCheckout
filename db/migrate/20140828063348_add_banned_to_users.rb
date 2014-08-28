class AddBannedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :banned_from_reviewing, :boolean
    add_column :users, :banned_from_rating, :boolean
  end
end
