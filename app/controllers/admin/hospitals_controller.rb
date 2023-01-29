class Admin::HospitalsController < ApplicationController

 #before_action :authenticate_admin!

  def new
   @hospital = Hospital.new
  end

  def index
  @hospitals = Hospital.page(params[:page])
  end

  def create
    @hospital = Hospital.new(hospital_params)
    @genre = Genre.all
    if @hospital.save
       flash[:notice] = "新規登録が完了しました。"
      redirect_to admin_hospital_path(@hospital.id)
    else
      render :new
    end
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])
    if @hospital.update(hospital_params)
       flash[:notice] = "編集されました。"
       redirect_to admin_hospitals_path
    else
       render :edit
    end
  end

  def destroy
  @hospital = Hospital.find(params[:id])
   if @hospital.destroy
  redirect_to admin_hospitals_path
   end
  end

  private
  # ストロングパラメータ
  def hospital_params
    params.require(:hospital).permit(:name, :introduction, :hospital_name_kana, :is_active, :subject, :image, :genre_id, :hospital_time, :postal_code, :telephone_number, :parking, :address)
  end
end
