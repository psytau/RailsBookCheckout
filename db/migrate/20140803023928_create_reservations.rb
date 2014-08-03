class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :book
      t.references :user
      t.datetime :reserved_date
      t.datetime :return_date
    end
  end
end
