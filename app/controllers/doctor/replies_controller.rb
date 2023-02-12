class Doctor::RepliesController < ApplicationController

 def new
 end

 def confirm
 end

 def create
 end

def index
 @review = Review.find(params[:review_id])
 #@replies = @review.replies 
end

 def show
 @review = Review.find(params[:review_id])
 @replies = @review.replies 
 end
end
