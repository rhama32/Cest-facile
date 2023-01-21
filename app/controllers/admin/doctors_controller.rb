class Admin::DoctorsController < ApplicationController

def index
 @doctors = Doctor.all
end

def update
 doctor = Doctor.find(params[:id])
 doctor.update!(is_active: true)
 flash[:notice] = "承認しました。"
 redirect_to admin_doctors_path
 end
end