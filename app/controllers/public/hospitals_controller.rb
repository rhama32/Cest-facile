class Public::HospitalsController < ApplicationController
 before_action :authenticate_customer!, except: [:index,:show]
 
 impressionist :actions => [:show]

  def index
  @genres = Genre.all
  if params[:genre_id]
    @genre = Genre.find(params[:genre_id])
    @hospitals = @genre.hospitals.page(params[:page]).per(6)
  else
    @hospitals = Hospital.where(is_active: true).page(params[:page]).per(6)
  end
 #一覧表示の病院数
  @count = @hospitals.where(is_active: true).count
  end

 #病院の詳細画面
  def show
    @genres = Genre.all
    @hospital = Hospital.find(params[:id])
    if session.id.present?
      impressionist @hospital, nil, unique: %i[impressionable_type impressionable_id session_hash]
    end
  end

  def hospital_params
    params.require(:hospital).permit(:name, :introduction)
  end
  
end