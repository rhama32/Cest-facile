class Doctor::ReviewsController < ApplicationController

  def index
  @hospital = Hospital.all
  @reviews = Review.all.where(hospital_id: current_doctor&.hospital&.id).page(params[:page]).per(5)
  # @is_joined = !current_doctor&.hospital&.id.nil?
 end
end
