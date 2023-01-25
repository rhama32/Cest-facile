class Public::FollowsController < ApplicationController
 before_action :authenticate_customer!

 def index
  @follows = current_customer.follows
  @doctor = Doctor.all
 end

 def show
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
  @doctors = current_customer.doctors
 end
# フォロワー一覧
 def followers
  current_customer.followers
 end

end
