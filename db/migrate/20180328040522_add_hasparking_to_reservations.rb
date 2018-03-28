class AddHasparkingToReservations < ActiveRecord::Migration[5.1]
  def change
    #add_column :reservations, :hasparking, :boolean
    change_column_default :reservations, :hasparking, true
    change_column_default :reservations, :hasinternet, true
    change_column_default :reservations, :nonsmoking, true
    change_column_default :reservations, :isreserved, true
    change_column_default :reservations, :confirmationcode, 'Not Reserved'
  end
end
