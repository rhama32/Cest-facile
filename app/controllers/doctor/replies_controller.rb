class Doctor::RepliesController < ApplicationController

 def new
 end

 def confirm
 end

 def create
 end

def index
 @review = Review.find(params[:review_id])
 @replys = @review.replies 
end

 def show
 end
end
