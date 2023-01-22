class Admin::DoctorsController < ApplicationController

def index
 @doctors = Doctor.all
end

def update
 doctor = Doctor.find(params[:id])
 if params[:approved_status] == 'approved'
  doctor.update(approved_status: 'approved')
  flash[:notice] = "承認"
 else
  doctor.update(approved_status: 'denied')
  flash[:notice] = "承認却下"
 end
 redirect_to admin_doctors_path
 end

private
 def list_params
  params.require(:doctor).permit(:name, :email, :telephone_number, :image)
 end
end