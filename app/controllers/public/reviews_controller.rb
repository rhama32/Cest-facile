class Public::ReviewsController < ApplicationController
before_action :authenticate_customer!
 def new
  @hospital = Hospital.find(params[:hospital_id])
  @review = @hospital.reviews.build
 end

 def confirm
 end

 def create
  @review = current_customer.reviews.build(review_params)
  @hospital = @review.hospital
  @review.customer_id = current_customer.id
   if @review.save
    flash[:notice] = "レビュー投稿が完了しました。"
    redirect_to public_reviews_path
   else
    flash.now[:alert] = "レビュー投稿に失敗しました。"
    render 'new'
   end
 end

 def index
  @hospital = Hospital.all
  @reviews = Review.all
 end

 def show
  @hospitals = Hospital.find(params[:id])
  @reviews = Review.find(params[:id])
  @reply = @reviews.reply
 end

 private
  def review_params
   params.require(:review).permit(:customer_id, :hospital_id, :doctor_satisfaction, :room_clean, :staff_satisfaction, :waiting_time, :comment, :total_point)
  end
end
