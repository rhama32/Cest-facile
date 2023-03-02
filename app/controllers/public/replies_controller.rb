class Public::RepliesController < ApplicationController
  
  before_action :authenticate_customer!
  before_action :require_current_customer, only: [:create]

  def create
    @review = Review.find(params[:review_id])
    @reply = current_customer.replies.build(reply_params)
    @reply.save
  end
  
  private
    def reply_params
      params.require(:reply).permit(:comment, :review_id)
    end
  
  def require_current_customer
    @review = Review.find(params[:review_id])
    @customer = @review.customer
    unless @customer == current_customer
      redirect_to about_path
    end
  end

end