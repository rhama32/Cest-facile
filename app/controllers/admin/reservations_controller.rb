class Admin::ReservationsController < ApplicationController

 def index
  @reservations = Reservation.all
 end

 def show
  @reservation = Reservation.find(params[:id])
 end

 def edit
 end

 def update
  @reservation = Reservation.find(params[:id])
  if @reservation.update(admin_reservation_params)
   flash[:notice] = "情報の変更が完了しました."
   redirect_to admin_reservation_path
  else
   render :show, flash[:alret] = "変更の保存に失敗しました"
  end
 end
 
 def destroy
  @reservation = Reservation.find(params[:id])
  @reservation.destroy
  redirect_to admin_reservations_path
 end

   def admin_reservation_params
    params.require(:reservation).permit(:status)
  end
end