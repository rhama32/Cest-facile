class SearchController < ApplicationController

 def search
  @range = params[:range]

  if @range == "Customer"
     @customers = Customer.looks(params[:search], params[:word])
  else
     @reviews = Review.looks(params[:search], params[:word])
  end
 end
 
 def reservation_search.looks(reservation)
   params check = true
   @reservations = Reservation.all
   @customer = Customer.where("reservation.hope_day.today < two_months LIKE?", "#{hope_day}")
   @public_customers = Customer.all
   @hospitals = Hospital.all
   redirect_to public_reservation_path
 end

end
