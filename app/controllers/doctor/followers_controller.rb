class Doctor::FollowersController < ApplicationController
before_action :authenticate_doctor!
 def index
   @doctor = current_doctor
   @followers = Follow.all
 end
end