class Public::SymptomsController < ApplicationController
 before_action :authenticate_customer!

 def index
   if params[:genre_id].present?
   @hospitals = Hospital.where(genre_id: params[:genre_id]).page(params[:page]).per(5)
 elsif params[:prefecture].present?
   @hospitals = Hospital.address_looks(params[:prefecture]).page(params[:page]).per(5)
 end 
   @personal_symptoms = Symptom.all
 end

 def show
   @hospitals = Hospital.page(params[:page]).per(5)
 end

end