class Doctor::HospitalDoctorsController < ApplicationController

  #管理者でログインしていない場合、ログイン画面へ遷移。
  before_action :authenticate_doctor!
  
  #医師マイページ詳細
  def show
    @doctor = current_doctor
    @hospital = Hospital.find_by(id: @doctor.hospital_id)
  end
  
  #医師マイページ編集
  def edit
    @doctor = current_doctor
  end
  
  #医師マイページ編集・更新
  def update
    @doctor = current_doctor
    if @doctor.update(hospital_doctor_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to edit_doctor_hospital_doctor_path(@doctor)
    else
      flash[:alert] = "編集に失敗しました。"
      render 'edit'
    end
  end
  
  def unsubscribe
    @doctor = current_doctor
  end
  
  #退会処理
  def withdraw
    @doctor = current_doctor
    @doctor.destroy
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
    def hospital_doctor_params
      params.require(:doctor).permit(:hospital_id, :email, :name, :name, :approved_status)
    end
    
end