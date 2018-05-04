class AccountController < ApplicationController
  def mybooking
  end

  def myreservation
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
end
