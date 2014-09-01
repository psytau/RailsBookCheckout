class AddReviewEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rate_email, :boolean
    add_column :users, :review_email, :boolean
    add_column :users, :daily_summary, :boolean
  end
end
