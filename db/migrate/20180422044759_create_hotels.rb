class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.decimal :latitude
      t.decimal :longitude
      t.string :google_id
      t.string :google_place_id
      t.string :photo_reference
      t.decimal :google_rating
      t.string :formatted_address
      t.string :city_name

      t.timestamps
    end
  end
end
