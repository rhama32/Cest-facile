class Doctor::HospitalDoctorsController < ApplicationController

 def show
  @hospital_doctor = current_doctor
 end

 def edit
  @hospital_doctor = current_doctor
 end

 def update
  @hospital_doctor = current_customer
  if @hospital_doctor.update(hospital_doctor_params)
     redirect_to doctors_update_path
  else
     render 'edit'
  end
  end

 def unsubscribe
  @hospital_doctor = current_doctor
 end

 def withdraw
  @hospital_doctor = current_doctor
  @hospital_doctor = current_doctor
  @hospital_doctor.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
 end

  private
  def hospital_doctor_params
   params.require(:hospital_doctor).permit(:hospital_id, :email, :name, :is_deleted)
  end

end
