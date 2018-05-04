class AddHotelpriceToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :hotel_price, :decimal, :default => 0.00
  end
end
