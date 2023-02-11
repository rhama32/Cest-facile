class Public::HospitalsController < ApplicationController
 before_action :authenticate_customer!, except: [:index,:show]
 
 impressionist :actions => [:show]

 def index
  @genres = Genre.all
  @hospitals = Hospital.all.page(params[:page]).per(6)

  if params[:genre_id]
    @genre = Genre.find(params[:genre_id])
    @hospitals = @genre.hospitals
  elsif @hospital_search
    @hospitals = @hospitals_search.page(params[:page]).per(6)
    @hospitals_count = @search_hospitals.all.count
  end

 #一覧表示の病院数
  @count = 0
  @hospitals.each do |hospital|
   if hospital.is_active == true
    @count = @count + 1
   end
  end
 end

 #病院の詳細画面
 def show
 @genres = Genre.all
 @hospital = Hospital.find(params[:id])
 impressionist(@hospital, nil, unique: [:session_hash])
 end
 
  def add_doctor
    @doctor = Doctor.find(params[:hospital_doctor_id])
    current_customer = Customer.find(params[:customer_id])
    @doctor.current_customer << current_customer
    redirect_to root_path, notice: "ドクターを追加しました。"
 end

 def hospital_params
  params.require(:hospital).permit(:name, :introduction)
 end
end
