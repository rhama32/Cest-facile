class Doctor::HospitalDoctorsController < ApplicationController

 def show
  @hospital_doctor = current_doctor
  @hospital = Hospital.find(@hospital_doctor.hospital_id)
 end

 def edit
  @hospital_doctor = current_doctor
 end

 def update
  @hospital_doctor = current_doctor
  if @hospital_doctor.update(hospital_doctor_params)
     redirect_to edit_doctor_hospital_doctor_path(@hospital_doctor)
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
   params.require(:doctor).permit(:hospital_id, :email, :name, :name, :approved_status)
  end

end
