class Public::ReviewsController < ApplicationController

 def new
  @review = Review.new
 end

 def confirm
 end

 def create
  @review = Review.new(review_params)
  @review.customer_id = current_customer.id
   if @review.save
   flash[:notice] = "レビュー投稿が完了しました。"
   redirect_to public_reviews_path
   else
   flash[:alert] = "レビュー投稿に失敗しました。"
   redirect_to public_reviews_path
   end
 end

 def index
  @hospital = Hospital.all
  @reviews = Review.all
 end

 def show
  @hospitals = Hospital.find(params[:id])
  @reservations = Reservation.find(params[:id])
 end

 private
  def reservation_params
   params.require(:review).permit(:customer_id, :hospital_id, :doctor_satisfaction, :room_clean, :staff_satisfaction, :waiting_time, :comment, :total_point)
  end
end
