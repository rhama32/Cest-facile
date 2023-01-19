class Public::ReservationsController < ApplicationController

 def new
  @reservation = Reservation.new
  @hospital = Hospital.all
 end

 def confirm
 end

 def create
  @reservation = Reservation.new(reservation_params)
  @reservation.customer_id = current_customer.id
  @reservation.status = 0
  if @reservation.save
   flash[:notice] = "予約の受付が完了しました。"
   redirect_to public_reservations_path
  else
   logger.info @reservation.errors.inspect
   flash[:alert] = "予約の受付に失敗しました。"
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

 def edit
 end

 private
  def reservation_params
   params.require(:reservation).permit(:customer_id, :hospital_id, :hope_day, :hope_time)
   end
end