class Doctor::ReviewsController < ApplicationController

  #医療者でログインしていない場合、ログイン画面へ遷移。
  before_action :authenticate_doctor!
  
  #レビュー一覧
  def index
    @hospital = Hospital.all
    @reviews = Review.all.where(hospital_id: current_doctor&.hospital&.id).page(params[:page]).per(5)
  end

end