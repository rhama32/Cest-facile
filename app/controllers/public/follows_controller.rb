class Public::FollowsController < ApplicationController
 before_action :authenticate_customer!

 def index
  @follows = current_customer.follows
  @doctor = Doctor.all
 end

 def show
  @customer = current_customer
  @follows = current_customer.follows
  @doctors = current_customer.doctors
  #@doctor = Doctor.find(params[:id])
 end

# フォローするとき
 def create
  current_customer.follow(params[:doctor_id])
  redirect_to request.referer
 end
# フォロー外すとき
 def destroy
  current_customer.unfollow(params[:doctor_id])
  redirect_to request.referer
 end
# フォロー一覧
 def followings
  @customer = current_customer
  @doctors = current_customer.doctors
 end
# フォロワー一覧
 def followers
  current_customer.followers
 end

end
