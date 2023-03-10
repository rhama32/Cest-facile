class Admin::ReviewsController < ApplicationController

  #管理者でログインしていない場合、ログイン画面へ遷移。
  before_action :authenticate_admin!
  
  def index
    @hospital = Hospital.all
    @reviews = Review.all
  end
  
  def show
    @review = Review.find(params[:id])
    #@reply = @reviews.reply
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path
  end
  
  private
  def review_params
    params.require(:review).permit(:customer_id, :hospital_id, :doctor_satisfaction, :room_clean, :staff_satisfaction, :waiting_time, :comment, :total_point)
  end

end