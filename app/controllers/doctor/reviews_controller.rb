class Doctor::ReviewsController < ApplicationController

  def index
  @hospital = Hospital.all
  @reviews = Review.all.where(hospital_id: current_doctor&.hospital&.id)
  # @is_joined = !current_doctor&.hospital&.id.nil?
 end
end
