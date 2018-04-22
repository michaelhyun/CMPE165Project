class HotelController < ApplicationController
	skip_before_action :authenticate_user!

	include HotelHelper
	def hotel_list
		if !params[:location].nil?
			@results_from_db = Hotel.all.where("city_name LIKE ?", params[:location])						
			if @results_from_db.nil? or @results_from_db.count == 0
				puts("Querying from GOOGLE PLACES.")
				add_results_to_db(params[:location])
				@results_from_db = Hotel.all.where("city_name LIKE ?", params[:location])				
			end
			@results = @results_from_db
		end
	end

	def add_results_to_db(location)
		results = google_place_search(location)			
		results = results['results']
		results.each do |result|
			hname = result['name']					
			hotel_exist = Hotel.where("hotel_name = ?", hname)		
			next if hotel_exist.count != 0				
				fmat_address = 			result['formatted_address']
				google_id = 			result['id']
				google_place_id = 		result['place_id']
				google_rating = 		result['rating']
				longitude = 			result['geometry']['location']['lng']
				latitude =  			result['geometry']['location']['lat']
				photoref =				helper_get_google_img(result)
				hotell = Hotel.create(  :hotel_name => hname, 
										:city_name => location, 
										:latitude=> latitude, 
										:longitude => longitude, 
										:formatted_address => fmat_address, 
										:google_id => google_id, 
										:google_place_id => google_place_id, 
										:google_rating => google_rating, 
										:photo_reference => photoref )			
				#store to database
				hotell.save
		end
	end

	def hotel_detail
		id = !params[:hotel].nil? ? params[:hotel] : 0
		@selected_hotel = Hotel.find(id)
		
		
	end

	def hotel_booking
	end

	def booking_complete

	end

	def google_place_next_page(tok)
		# Need to wait 4 seconds...
		sleep 4
		api_key = "AIzaSyAw_tCp8oVeFxIyk7Nb5ZZqKxKnTpiE6yI"
		url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?pagetoken=#{tok}&key=#{api_key}"
		respose = Faraday.get url
		result = JSON.parse(respose.body)
		return result
	end

	def google_place_search(where)
		#https://developers.google.com/places/web-service/search
		api_key = "AIzaSyAw_tCp8oVeFxIyk7Nb5ZZqKxKnTpiE6yI"
		query = "#{where}"
		query.gsub(" ", "+")
		url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=hotel+in+#{query}&key=#{api_key}"
		response = Faraday.get url
		results = JSON.parse(response.body)
		return results
	end































	def find_matching_hotel(name, address, results)
		table = Hash.new
		cleaned_name = name.downcase().strip()
		cleaned_address = address.gsub(", USA", "")

		results["results"].each do |hotel|
			result_name = hotel['property_name'].downcase().strip()	
			result_zip = hotel["address"]["postal_code"]

			unless !result_zip.nil?
				next
			end

			if cleaned_address.include? result_zip
				puts result_name
			end

			puts "#{cleaned_address} #{hotel["address"]["line1"]}"

			if result_name.include? cleaned_name
				table['property_name'] = hotel["property_name"]
				table['price'] = hotel["total_price"]["amount"]
				table['phone'] = hotel["contacts"][0]["detail"]
				table['fax'] = hotel["contacts"][1]["detail"]
				table['address'] = "#{hotel["address"]["line1"]} #{hotel["address"]["city"]}, #{hotel["address"]["region"]} #{hotel["address"]["postal_code"]}" 
				table['room_type'] = hotel["rooms"][0]["room_type_info"]["room_type"]
				table['bed_size'] = hotel["rooms"][0]["room_type_info"]["bed_type"]
				table['number_of_beds'] = hotel["rooms"][0]["room_type_info"]["number_of_beds"]
			end
		end
		return table
	end

	def amadeus_search(long, lat)
		ama_api_key = '5G4EwbqGRnRI0AS52AzcvP52Jn3MwdkY'
		radius = 20
		check_in_date = '2018-05-06'
		check_out_date = '2018-05-07'
		url = "http://api.sandbox.amadeus.com/v1.2/hotels/search-circle?latitude=#{lat}&longitude=#{long}&radius=#{radius}&check_in=#{check_in_date}&check_out=#{check_out_date}&number_of_results=100&apikey=#{ama_api_key}"
		res = Faraday.get url
		hotels_list = JSON.parse(res.body)
	end

	def google_get_lat_long(city)
		#https://developers.google.com/maps/documentation/geocoding/start
		#AIzaSyD2gkg2sJXPl8frckjBigMxnSu5wCXUq7Q geocoding API KEY
		rsc_url_1 = "https://maps.googleapis.com/maps/api/geocode/json?address="
		rsc_url_2 = "San%20Jose"
		api_key = "&key=AIzaSyD2gkg2sJXPl8frckjBigMxnSu5wCXUq7Q"
		rsc = "#{rsc_url_1}#{rsc_url_2}#{api_key}"
		response = Faraday.get rsc
		#AIzaSyDnv9drro7cagyJDAJNk7p2UBFAF0kvXQA
	end

	#dont use too slow.
	def city_name_search(city)
		city_name = city
		unless city_name.nil?
			city_name = "San%20Jose"
		end
		#replace white spaces.
		city_name.gsub(" ", "%20")
		api_key = "vr7UJMGlyK75TAnqbjZzLff4RzhNHEG2" #Thao's key. Move this later to env section.
		rsc_url = "https://api.sandbox.amadeus.com/v1.2/points-of-interest/"
		rsc_url_api = "yapq-search-text?apikey=#{api_key}"
		rsc_url_city = "&city_name=#{city_name}"
		#/v1.2/points-of-interest/yapq-search-text?apikey=vr7UJMGlyK75TAnqbjZzLff4RzhNHEG2&city_name=Boston
		get_url = "#{rsc_url}#{rsc_url_api}#{rsc_url_city}"
		response = Faraday.get get_url
	end
end
