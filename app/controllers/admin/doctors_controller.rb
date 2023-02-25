class Admin::DoctorsController < ApplicationController

  #管理者でログインしていない場合、ログイン画面へ遷移。
  before_action :authenticate_admin!
  
  #医師一覧
  def index
    @doctors = Doctor.all
  end
  
  #医師詳細
  def show
    @doctor = Doctor.find(params[:id])
  end
  
  #医師編集
  def edit
    @doctor = Doctor.find(params[:id])
  end
  
  #医師承認
  def update
    doctor = Doctor.find(params[:id])
    if params[:approved_status] == 'approved'
      doctor.update(approved_status: 'approved')
      doctor.save_notification_doctor!(current_admin)
      flash[:notice] = "承認されました。"
    else
      doctor.update(approved_status: 'denied')
      flash[:notice] = "承認が却下されました。"
    end
      doctor.update(list_params) if params[:m]
    
    if params[:m] == 'doctor'
      redirect_to admin_doctor_path(doctor), notice: '更新しました'
    else
      redirect_to admin_doctors_path
    end
  end
  
  #医師削除
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to admin_doctors_path
  end
  
  private
  def list_params
    params.require(:doctor).permit(:name, :email, :telephone_number, :image)
  end

end