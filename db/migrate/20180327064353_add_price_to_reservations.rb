class AddPriceToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :price, :int
  end
end
