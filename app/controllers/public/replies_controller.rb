class Public::RepliesController < ApplicationController
before_action :authenticate_customer!
before_action :require_current_customer, only: [:create]

  def new
  end
  
  def confirm
  end
  
  def create
    @review = Review.find(params[:review_id])
    #byebug
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
  
  def require_current_customer
    @review = Review.find(params[:review_id])
    @customer = @review.customer
    unless @customer == current_customer
      redirect_to about_path
    end
  end
end
