class AddImgurlToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :imgurl, :string
  end
end
