class SearchesController < ApplicationController
before_action :authenticate_customer!

 def search
  @range = params[:range]

  if @range == "Customer"
     @customers = Customer.looks(params[:search], params[:word])
  else
     @reviews = Review.looks(params[:search], params[:word])
  end
  @reviews = Review.all.page(params[:page]).per(5)
 end

 def hospital_search
  @range = params[:range]
  if @range == "病院名"
     @hospitals = Hospital.looks(params[:word])
  else
    @hospitals = Hospital.address_looks(params[:word])
  end
 end
end