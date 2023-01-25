class SearchController < ApplicationController
before_action :authenticate_customer!
before_action :authenticate_doctor!

 def search
  @range = params[:range]

  if @range == "Customer"
     @customers = Customer.looks(params[:search], params[:word])
  else
     @reviews = Review.looks(params[:search], params[:word])
  end
 end
 
   @range = params[:range]

 def hospital_search
  if @range == "Hospital"
     @hospitals = Hospital.name.looks(params[:search], params[:word])
  elsif
     @hospitals = Hospital.subject.looks(params[:search], params[:word])
  else
     @hospitals = Hospital.parking.looks(params[:search], params[:word])
  end
 end
end
