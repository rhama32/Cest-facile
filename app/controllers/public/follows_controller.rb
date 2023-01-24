class Public::FollowsController < ApplicationController

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
  customer = Customer.find(params[:customer_id])
  @customer = customer.followings
 end
# フォロワー一覧
 def followers
  customer = Customer.find(params[:customer_id])
  @customers = customer.followers
 end

end
