# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Booking.create!(check_in: Time.now.to_date, check_out: Time.now.to_date, total_price: 499.00, transaction_id: "KMJHFBDEUE439S", room_type: 'Single Room', num_adults: 1, num_child: 1, user_id: 1, hotel_id: 36)
# Example JSON file:
# {
#     "results":
#     [
#         {
#             "total_price": {"currency": "USD", "amount": "484.50"},
#             "contacts": [{"type": "PHONE", "detail": "1-650-5897200"}, {"type": "FAX", "detail": "1-650-5890191"}],
#             "min_daily_rate": {"currency": "USD", "amount": "16.80"},
#             "_links": {"more_rooms_at_this_hotel": {"href": "https://api.sandbox.amadeus.com/v1.2/hotels/LMSFO479?currency=USD&check_in=2018-04-25&apikey=5G4EwbqGRnRI0AS52AzcvP52Jn3MwdkY&check_out=2018-04-30&referrer=more_rooms_at_this_hotel"}},
#             "images": [],
#             "amenities": [{"amenity": "RESTAURANT", "description": "Restaurant", "ota_code": 76}, {"amenity": "ACCESSIBLE_FACILITIES", "description": "Accessible facilities", "ota_code": 47}, {"amenity": "BABY_SITTING", "description": "Baby sitting", "ota_code": 8}, {"amenity": "CHILDREN_WELCOME", "description": "Children welcome", "ota_code": 218}, {"amenity": "HOTSPOTS", "description": "Hotspots", "ota_code": 221}, {"amenity": "FREE_HIGH_SPEED_INTERNET", "description": "Free high speed internet connection", "ota_code": 222}, {"amenity": "LAUNDRY_SERVICE", "description": "Laundry/Valet service", "ota_code": 58}, {"amenity": "PARKING", "description": "Parking", "ota_code": 68}, {"amenity": "LOUNGE_BARS", "description": "Lounges/bars", "ota_code": 165}, {"amenity": "POOL", "description": "Pool", "ota_code": 71}, {"amenity": "LOUNGE_BARS", "description": "Lounges/bars", "ota_code": 165}],
#             "location": {"latitude": 37.64815, "longitude": -122.40446},
#             "address": {"city": "South San Francisco", "region": "CA", "postal_code": "94080", "line1": "245 South Airport Blvd", "country": "US"},
#             "property_code": "LMSFO479",
#             "awards": [{"rating": "2", "provider": "Local Star Rating"}, {"rating": "2", "provider": "Mobil"}],
#             "property_name": "Park Pointe Hotel",
#             "rooms": [{"total_amount": {"currency": "USD", "amount": "484.50"}, "rate_plan_code": "RAC", "room_type_info": {"bed_type": "Queen", "room_type": "Non-smoking", "number_of_beds": "1"}, "room_type_code": "N1Q", "rates": [{"price": 84.0, "start_date": "2018-04-25", "end_date": "2018-04-30", "currency_code": "USD"}],
#             "descriptions": ["PARK PERKS EXCLUSIVE DEALS", "DELUXE QUEEN PARKING ACCESS NEWLY REMODELED", "Free SFO Airport Shuttle "],
#             "rate_type_code": "RAC", "booking_code": "N1QRAC"}]
#         },
#         {
#             ....
#         }
#     ]
# }


# Reading data from JSON and need to generate model
#
                # require 'json'

                # file = File.read("hotelsJSON.txt")
                # hotels_list = JSON.parse(file)

                # hotels_list["results"].each do |hotel|
                #     hotel_name1 = hotel["property_name"]
                #     price_per_day1 = hotel["total_price"]["amount"]
                #     phone1 = hotel["contacts"][0]["detail"]
                #     fax1 = hotel["contacts"][1]["detail"]
                #     address1 = "#{hotel["address"]["line1"]} #{hotel["address"]["city"]}, #{hotel["address"]["region"]} #{hotel["address"]["postal_code"]}"
                #     image1 = hotel["image"]
                #     number_of_nights1 = 1
                #     room_type1 = hotel["rooms"][0]["room_type_info"]["room_type"]
                #     size_of_bed1 = hotel["rooms"][0]["room_type_info"]["bed_type"]
                #     number_of_beds1 = hotel["rooms"][0]["room_type_info"]["number_of_beds"]


                #     ratings = Array.new
                #     avg_rating1 = 0
                #     index = 0
                #     sum = 0;


                #     until hotel["awards"][index].nil? do
                #         ratings.push(hotel["awards"][index]["rating"])
                #         index += 1
                #     end

                #     ratings.each do |r|
                #         sum += r.to_i
                #     end

                #     if index != 0
                #         avg_rating1 = sum/index.to_f
                #     end

                #     reservation = Reservation.create(
                #         hotel_name = hotel_name1,
                #         price_per_day = price_per_day1,
                #         phone = phone1,
                #         fax = fax1,
                #         address = address1,
                #         image = image1,
                #         number_of_nights = number_of_nights1,
                #         room_type = room_type1,
                #         size_of_bed = size_of_bed1,
                #         number_of_beds = number_of_beds1
                #         )
                # end
