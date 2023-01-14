class Public::ReservationsController < ApplicationController

 def new
  @reservation = Reservation.new
  @hospital = Hospital.all
 end

 def confirm
 end



 def create
  @reservation = Reservation.new
  if @reservation.save
   flash[:notice] = "予約の受付が完了しました。"
   redirect_to public_reservations_path
 end
end

 def index
  @reservations = Reservation.all
  @public_customers = Customer.all
  @hospitals = Hospital.all
 end

 def show
  @reservations = Reservation.find(params[:id])
  @public_customers = current_customer
  @hospitals = Hospital.find(params[:id])
 end
end