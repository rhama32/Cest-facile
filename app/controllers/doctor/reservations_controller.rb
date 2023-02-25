class Doctor::ReservationsController < ApplicationController
  
  #医療者でログインしていない場合、ログイン画面へ遷移。
  before_action :authenticate_doctor!

#予約一覧
def index
  @reservations = []
  #所属先医療施設がある場合
  if current_doctor.hospital_id != nil
  @reservations = current_doctor.hospital.reservations.page(params[:page]).per(5)
  end
end

#予約詳細
def show
  @reservation = Reservation.find(params[:id])
  @customer = @reservation.customer
end

#予約編集
def edit
end

#予約編集・更新
def update
  @reservation = Reservation.find(params[:id])
  if @reservation.update(doctor_reservation_params)
    flash[:notice] = "情報の変更が完了しました."
  else
    flash[:alret] = "変更の保存に失敗しました"
  end
  redirect_to doctor_reservations_path
end

#ストロングパラメータ
def doctor_reservation_params
  params.require(:reservation).permit(:status)
end

end