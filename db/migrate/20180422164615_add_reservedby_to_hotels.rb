class AddReservedbyToHotels < ActiveRecord::Migration[5.1]
  def change
    change_column :hotels, :hotel_name, :string, unique: true
    add_column :hotels, :reserved_by, :string
  end
end
