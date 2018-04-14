class HotelController < ApplicationController
	include HotelHelper
	def hotel_list
		default_loc = ''
		if !params[:location].nil?
			default_loc = "#{params[:location]}"
			@results = google_place_search(default_loc)
		end
	end

	def hotel_detail

	end

	def hotel_booking
	end

	def booking_complete

	end

	def google_place_search(where)
		#https://developers.google.com/places/web-service/search
		api_key = "AIzaSyAw_tCp8oVeFxIyk7Nb5ZZqKxKnTpiE6yI"
		#https://maps.googleapis.com/maps/api/place/textsearch/xml?query=restaurants+in+Sydney&key=YOUR_API_KEY
		query = "#{where}"
		query.gsub(" ", "+")
		url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=hotel+in+#{query}&key=#{api_key}"
		response = Faraday.get url
		results = JSON.parse(response.body)		
		results = results['results']
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
