class Doctor::FollowsController < ApplicationController

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
