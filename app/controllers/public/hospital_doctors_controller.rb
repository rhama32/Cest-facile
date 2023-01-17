class Public::HospitalDoctorsController < ApplicationController
   before_action :authenticate_doctor!
  def show
   @doctor = current_hospital_doctor
  end

  def edit
   @doctor = current_doctor
  end

  def update
   @doctor = current_doctor
    if @doctor.update(hospital_doctor_params)
      redirect_to doctors_mypage_path
    else
      render 'edit'
    end
  end

  def unsubscribe
    @doctor = current_doctor
  end

  def withdraw
    @docotor = current_doctor
    @doctor.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
    def hospital_doctor_params
       params.require(:hospital_doctor).permit(:email, :name)
    end
end
