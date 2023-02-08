class Doctor::FollowsController < ApplicationController
before_action :authenticate_doctor!
 def index
   @follows = Follow.all
 end

 def show
 end

 def create
 end

 def destroy
 end
end
