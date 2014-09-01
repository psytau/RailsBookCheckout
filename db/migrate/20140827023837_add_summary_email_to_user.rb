class AddSummaryEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :rate_email_summary, :integer, :default => 0
    add_column :users, :review_email_summary, :integer, :default => 0
  end
end

