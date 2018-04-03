class AddReservedbyuseridToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :reservedbyuserid, :string
    #change_column_default :reservations, :isreserved, false
    change_column :reservations, :reservedbyuserid, :int
  end
end
