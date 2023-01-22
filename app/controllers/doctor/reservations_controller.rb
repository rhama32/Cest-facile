class Doctor::ReservationsController < ApplicationController
 before_action :authenticate_doctor!
 def index
  @reservations = Reservation.all
 end

 def show
  @reservation = Reservation.find(params[:id])
  @admin_customer = Customer.find(params[:id])
  @hospital = Hospital.find(params[:id])
 end

 def edit
 end

 def update
  @reservation = Reservation.find(params[:id])
  if @reservation.update(doctor_reservation_params)
   flash[:notice] = "情報の変更が完了しました."
   redirect_to doctor_reservation_path
  else
   flash[:alret] = "変更の保存に失敗しました"
  end
 end

    def doctor_reservation_params
    params.require(:reservation).permit(:status)
  end
end