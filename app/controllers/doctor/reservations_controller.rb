class Doctor::ReservationsController < ApplicationController
 before_action :authenticate_doctor!
 def index
  @reservations = []
  # 所属先医療施設がある場合
  if current_doctor.hospital != nil
   @reservations = current_doctor.hospital.reservations.page(params[:page]).per(5)
  end
 end

 def show
  @reservation = Reservation.find(params[:id])
  @customer = @reservation.customer
  #@hospital = Hospital.find(params[:id])
 end

 def edit
 end

 def update
  @reservation = Reservation.find(params[:id])
  #byebug
  if @reservation.update(doctor_reservation_params)
   flash[:notice] = "情報の変更が完了しました."
  else
   flash[:alret] = "変更の保存に失敗しました"
  end
  redirect_to doctor_reservations_path
 end

   def doctor_reservation_params
    params.require(:reservation).permit(:status)
  end
end