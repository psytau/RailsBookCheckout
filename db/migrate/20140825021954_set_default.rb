class SetDefault < ActiveRecord::Migration
  def up
  	change_column :users, :rate_email, :boolean, :default => 1
  	change_column :users, :review_email, :boolean, :default => 1
  	change_column :users, :daily_summary, :boolean, :default => 0
  end

  def down
  	change_column :users, :rate_email, :boolean
  	change_column :users, :review_email, :boolean
  	change_column :users, :daily_summary, :boolean
  end
end
