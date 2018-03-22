class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :roomtype
      t.integer :numberofbeds
      t.string :hotelname
      t.datetime :checkindate
      t.datetime :checkoutdate
      t.boolean :hasinternet
      t.boolean :hasparking
      t.boolean :nonsmoking
      t.datetime :lastdatetocancel
      t.boolean :isreserved
      t.string :confirmationcode

      t.timestamps
    end
  end
end
