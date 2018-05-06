class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.decimal :total_price
      t.string :transaction_id
      t.string :room_type
      t.integer :num_adults
      t.integer :num_child
      t.integer :user_id
      t.integer :hotel_id
      t.timestamps
    end
  end
end
