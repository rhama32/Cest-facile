class Public::SymptomsController < ApplicationController
 before_action :authenticate_customer!

 def index
  @genres = Genre.all
  @hospitals = Hospital.all.page(params[:page]).per(6)

  if params[:genre_id].present? && params[:prefecture].present?
    # ジャンル&エリア検索
    @hospitals = Hospital.where(genre_id: params[:genre_id]).where("address LIKE ?", "%#{params[:prefecture]}%").page(params[:page]).per(5)
  elsif params[:genre_id].present?
    # ジャンル検索
    @hospitals = Hospital.where(genre_id: params[:genre_id]).page(params[:page]).per(5)
  elsif params[:prefecture].present?
    # 都道府県
    @hospitals = Hospital.address_looks(params[:prefecture]).page(params[:page]).per(5)
  end
    

 end

 def show
   @hospitals = Hospital.find.page(params[:page]).per(5)
 end

end