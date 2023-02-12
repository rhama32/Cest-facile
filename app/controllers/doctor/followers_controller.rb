class Doctor::FollowersController < ApplicationController
before_action :authenticate_doctor!
 def index
   @followers = Follow.all
 end
end