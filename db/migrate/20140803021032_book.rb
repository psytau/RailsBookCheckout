class Book < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :status
      t.string :isbn
      t.integer :rating
      t.boolean :active
      t.datetime :approved_at

      t.timestamps
    end
  end
end
