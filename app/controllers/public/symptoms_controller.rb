class Public::SymptomsController < ApplicationController
 before_action :authenticate_customer!

 def index
   if params[:personal_symptom].present?
   @hospitals = Hospital.where(subject: Symptom.where(personal_symptom:params[:personal_symptom]).pluck(:subject)).page(params[:page]).per(5)
 else
  # @hospitals = Hospital.page(params[:page]).per(5)
 end 
   @personal_symptoms = Symptom.all
 end

 def show
   @hospitals = Hospital.page(params[:page]).per(5)
 end

end