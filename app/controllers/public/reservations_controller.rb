class Public::ReservationsController < ApplicationController

 def new
  @reservations = Reservation.all
  @public_customers = current_customer
  @hospitals = Hospital.all
 end

 def confirm
 end

 def complete
 end

 def create
 end

 def index
 end

 def show
 end
end
