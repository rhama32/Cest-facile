class Public::HospitalDoctorsController < ApplicationController
 before_action :authenticate_customer!
 
 def index
  @hospital_doctors = Doctor.all
 end
 
 def show
  @hospital_doctor = Doctor.find(params[:id])
  @hospital = Hospital.find_by(id: @hospital_doctor.hospital_id)
 end
 
end
