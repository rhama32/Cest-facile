class SearchController < ApplicationController

 def search
  @range = params[:range]

  if @range == "Customer"
     @customers = Customer.looks(params[:search], params[:word])
  else
     @reviews = Review.looks(params[:search], params[:word])
  end
 end

end
