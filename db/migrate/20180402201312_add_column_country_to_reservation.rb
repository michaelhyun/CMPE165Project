class AddColumnCountryToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :country, :string
  end
end
