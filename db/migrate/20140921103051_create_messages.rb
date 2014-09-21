class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.integer :originator_id, index: true # user_id of message originator
      t.string :kind
      t.integer :kind_id

      t.timestamps
    end
  end
end
