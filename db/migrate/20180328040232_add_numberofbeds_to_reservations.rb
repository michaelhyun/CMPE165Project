class AddNumberofbedsToReservations < ActiveRecord::Migration[5.1]
  def change
    change_column_default :reservations, :numberofbeds, 1
  end
end
