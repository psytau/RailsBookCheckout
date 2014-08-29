class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :book
      t.references :user
      t.datetime :followed_date
    end
  end
end
