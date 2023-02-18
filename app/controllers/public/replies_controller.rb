class Public::RepliesController < ApplicationController
before_action :authenticate_customer!

  def new
  end
  
  def confirm
  end
  
  def create
    @review = Review.find(params[:review_id])
    @reply = current_customer.replies.build(reply_params)
    if @reply.save
    else
    end
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
