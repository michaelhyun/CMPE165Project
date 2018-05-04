class AccountController < ApplicationController
  def mybooking
  end

  def myreservation
    curr_user_id = current_user.id

    #curr_user_id = !params[:current_user_id].nil? ? params[:current_user_id] : ''
    @results = Hotel.all.where("reserved_by LIKE ?", curr_user_id)



    #   if !params[:location].nil?
    #       @results_from_db = Hotel.all.where("city_name LIKE ?", params[:location])
    #       if @results_from_db.nil? or @results_from_db.count == 0
    #           puts("Querying from GOOGLE PLACES.")
    #           add_results_to_db(params[:location])
    #           @results_from_db = Hotel.all.where("city_name LIKE ?", params[:location])
    #       end
    #       @results = @results_from_db
    #   end
  end
end
