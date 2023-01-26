class SearchController < ApplicationController
before_action :authenticate_customer!

 def search
  @range = params[:range]

  if @range == "Customer"
     @customers = Customer.looks(params[:search], params[:word])
  else
     @reviews = Review.looks(params[:search], params[:word])
  end
 end

 def hospital_search
  @range = params[:range]
  
  if @range == "Hospital"
     @hospitals = Hospital.looks(params[:search], params[:word])
  end
 end
end
