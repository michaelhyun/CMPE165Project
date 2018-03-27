class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :firstname
      t.string :lastname
      t.string :confirmation
      t.string :email

      t.timestamps
    end
  end
end