class Admin::ReservationsController < ApplicationController

 def index
  @reservations = Reservation.all
  @admin_customers = Customer.all
  @hospitals = Hospital.all
 end

 def show
  @reservation = Reservation.find(params[:id])
  @admin_customer = Customer.find(params[:id])
  @hospital = Hospital.find(params[:id])
 end

 def update
 end
end
