class Admin::DoctorsController < ApplicationController

def index
 @doctors = Doctor.all
end

def show
 @doctor = Doctor.find(params[:id])
 @doctors = hospital_doctors.is_deleted
end

def edit
 @doctor = Doctor.find(params[:id])
end

#doctorの承認画面で使用
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
 redirect_to admin_doctors_path
 end

private
 def list_params
  params.require(:doctor).permit(:name, :email, :telephone_number, :image)
 end
end