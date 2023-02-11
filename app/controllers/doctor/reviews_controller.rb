class Doctor::ReviewsController < ApplicationController

  def index
  @hospital = Hospital.all
  @reviews = Review.all
 end
end
