class Public::ReservationsController < ApplicationController
before_action :authenticate_customer!
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
  if params[:name] == "two_month"
   @reservations = Reservation.where(hope_day: Time.current.since(2.month)..)
  elsif params[:name] == "four_month"
   @reservations = Reservation.where(hope_day: Time.current.since(4.month)..)
  else
   @reservations = Reservation.all
  end
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

  def update
  @reservations = Reservation.find(params[:id])
  if @reservations.update(reservation_params)
   flash[:notice] = "情報の変更が完了しました."
   redirect_to public_reservation_path
  else
   flash[:alret] = "変更の保存に失敗しました"
  end
 end

 private
  def reservation_params
   params.require(:reservation).permit(:customer_id, :hospital_id, :hope_day, :hope_time)
   end
end