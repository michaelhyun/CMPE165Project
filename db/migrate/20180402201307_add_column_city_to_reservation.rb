class AddColumnCityToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :city, :string
  end
end
