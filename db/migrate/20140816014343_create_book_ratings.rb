class CreateBookRatings < ActiveRecord::Migration
  def change
    create_table :book_ratings do |t|
      t.integer :rating
      t.references :book, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
