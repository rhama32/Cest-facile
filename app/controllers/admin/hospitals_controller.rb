class Admin::HospitalsController < ApplicationController

#管理者でログインしていない場合、ログイン画面へ遷移。
before_action :authenticate_admin!

#病院新規作成
def new
  @hospital = Hospital.new
end

#病院一覧
def index
  @hospitals = Hospital.page(params[:page])
end

#病院新規作成
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

#病院詳細
def show
  @hospital = Hospital.find(params[:id])
end

#病院編集
def edit
  @hospital = Hospital.find(params[:id])
end

#病院更新
def update
  @hospital = Hospital.find(params[:id])
  if @hospital.update(hospital_params)
    flash[:notice] = "編集されました。"
    redirect_to admin_hospitals_path
  else
    render :edit
  end
end

#病院削除
def destroy
  @hospital = Hospital.find(params[:id])
  if @hospital.destroy
    redirect_to admin_hospitals_path
  end
end

private
#ストロングパラメータ
def hospital_params
  params.require(:hospital).permit(:name, :introduction, :hospital_name_kana, :is_active, :subject, :image, :genre_id, :hospital_time, :postal_code, :telephone_number, :parking, :address)
end

end