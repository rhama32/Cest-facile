class Public::RepliesController < ApplicationController
before_action :authenticate_customer!

  def new
  end
  
  def confirm
  end
  
  def create
    @review = Review.find(params[:review_id])
    # @replies = @review.replies
    @reply = current_customer.replies.build(reply_params)
    @reply.save
    # if @reply.save
    #   redirect_to 
    # else
    # end
  end
  
  def index
  end
  
  def show
  end
  
  private
  
  def reply_params
    params.require(:reply).permit(:comment, :review_id)
  end
end
