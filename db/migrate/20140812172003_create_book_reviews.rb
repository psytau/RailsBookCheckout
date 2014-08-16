class CreateBookReviews < ActiveRecord::Migration
  def change
    create_table :book_reviews do |t|
      t.text :content
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
