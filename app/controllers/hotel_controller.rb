class HotelController < ApplicationController
	skip_before_action :authenticate_user!

	include HotelHelper
	def hotel_list	
		if !params[:location].nil?
			@results_from_db = Hotel.all.where("city_name LIKE ?", params[:location])						
			if @results_from_db.nil? or @results_from_db.count == 0
				add_results_to_db(params[:location])
				@results_from_db = Hotel.all.where("city_name LIKE ?", params[:location])				
			end
			if !params[:hotel_name].nil? 
				@results = @results_from_db.select { |h| h.hotel_name.include? params[:hotel_name] }						
			else
				@results = @results_from_db
			end
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
				hprice = rand(50..199)
				hotell = Hotel.create(  :hotel_name => hname, 
										:city_name => location, 
										:latitude=> latitude, 
										:longitude => longitude, 
										:formatted_address => fmat_address, 
										:google_id => google_id, 
										:google_place_id => google_place_id, 
										:google_rating => google_rating, 
										:photo_reference => photoref,
										:hotel_price => hprice )			
				#store to database
				hotell.save
		end
	end

	def hotel_detail
		id = !params[:hotel].nil? ? params[:hotel] : 0
		@selected_hotel = Hotel.find(id)
		
		
	end

    # GET payment form
	def hotel_booking
		@hotel_to_book = Hotel.find(params[:hotel_id])
		@total_price = 0
		@hotel_id = params[:hotel_id]
		@checkin_date = !params[:checkin_date].nil? ? Date.parse(params[:checkin_date]) : Date.today
		@checkout_date = !params[:checkout_date].nil? ? Date.parse(params[:checkout_date]) : 1.day.from_now
		@number_nights = (@checkout_date.to_date - @checkin_date.to_date).to_i
		@room_price = params[:room_price].to_i
		@room_count = params[:room_count]
		@adult_count = params[:adult_count]
		@child_count = params[:child_count]
		@total_price = @total_price + (@room_price * @number_nights)
	end



    def book_hotel_with_rewards
    	@user = current_user
        @user.reward_points = @user.reward_points-10
        @user.save
    	redirect_to booking_complete_path
    end
    helper_method :book_hotel_with_rewards


    # POST for submitting payment info
	def book_hotel
		booked_hotel = Hotel.find(params[:param_hotel_id])
		total_amount = (params[:param_price]).to_i
		selected_room_type = params[:param_selected_room]

		checkin_date = params[:param_checkin_date]
		checkout_date = params[:param_checkout_date]

		num_of_nights = params[:param_num_of_nights]
		adult_count = params[:param_adult_count]
		child_count = params[:param_child_count]

		hotel_id = params[:param_hotel_id]
		trans_id = params[:stripeToken]

		@amount = total_amount 
        @user = current_user
        @user.reward_points = @user.reward_points+1
		@user.save
		
		@booking = Booking.create( check_in: checkin_date,  
								   check_out: checkout_date,
								   total_price: total_amount,
								   transaction_id: trans_id,
								   num_adults: adult_count,
								   num_child: child_count,
								   user_id: current_user.id,
								   hotel_id: hotel_id )


        begin
            # for now, creates a new customer and (transparently) unique customer id per transaction
            # TODO: store customer.id in User model (this associates user with payment credentials stored by stripe)
            customer = Stripe::Customer.create(
                :email   => params[:stripeEmail],
                :source  => params[:stripeToken] # this token corresponds to the entered card details
            )

            # creates one-time charge for hotel booking
            charge = Stripe::Charge.create(
                :customer    => customer.id,
                :amount      => @amount,
                :description => 'Rails Stripe customer',
                :currency    => 'usd'
            )
            redirect_to booking_complete_path

        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to hotel_booking_path
        end
    end

    # GET payment confirmation page
	def booking_complete
		@room_count = params[:room_count]
		@adult_count = params[:adult_count]
		@child_count = params[:child_count]
	end

	def booking_delete
		target = Booking.find(params[:booking])
		target.destroy()
	end

	def booking_update  
		target = Booking.find(params[:booking])
		target.num_adults = params[:adult_count]
		target.num_child = params[:child_count]
		target.check_in = params[:checkin_date]
		target.check_out = params[:checkout_date]
		target.save
	end

	def booking_update_details
		@booking = params[:booking]
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
