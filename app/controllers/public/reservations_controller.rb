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
   # logger.info @reservation.errors.inspect
   flash[:alert] = "予約の受付に失敗しました。"
   redirect_to public_reservations_path
 end
end

 def index
  if params[:name] == "two_month"
   @reservations = current_customer.reservations.where(hope_day: Time.current..Time.current.since(2.month))
  elsif params[:name] == "four_month"
   @reservations = current_customer.reservations.where(hope_day: Time.current..Time.current.since(4.month))
  elsif params[:name] == 'old'
   @reservations = current_customer.reservations
  else
   @reservations = current_customer.reservations.where.not(hope_day: ..Time.current)
  end
  @public_customers = Customer.all
  @hospitals = Hospital.all
 end

 def show
  @reservation = Reservation.find(params[:id])
  @public_customers = current_customer
  @hospital = @reservation.hospital
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
 
 def destroy
  @reservation = Reservation.find(params[:id])
  @reservation.destroy
  redirect_to public_reservations_path
 end

 private
  def reservation_params
   params.require(:reservation).permit(:customer_id, :hospital_id, :hope_day, :hope_time)
   end
end