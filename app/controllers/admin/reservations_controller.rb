class Admin::ReservationsController < ApplicationController

#管理者でログインしていない場合、ログイン画面へ遷移。
before_action :authenticate_admin!

#予約一覧
def index
  @reservations = Reservation.all
end

#予約詳細
def show
  @reservation = Reservation.find(params[:id])
end

#予約編集
def edit
end

#予約ステータス更新
def update
  @reservation = Reservation.find(params[:id])
  if @reservation.update(admin_reservation_params)
    flash[:notice] = "情報の変更が完了しました."
    redirect_to admin_reservation_path
  else
    render :show, flash[:alret] = "変更の保存に失敗しました"
  end
end
 
#予約削除
def destroy
  @reservation = Reservation.find(params[:id])
  @reservation.destroy
  redirect_to admin_reservations_path
end

#ストロングパラメータ
def admin_reservation_params
  params.require(:reservation).permit(:status)
end

end