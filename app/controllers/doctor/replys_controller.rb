class Doctor::ReplysController < ApplicationController

 def new
 end

 def confirm
 end

 def create
 end

 def index
  @hospital = Hospital.all
  @reviews = Review.all
 end

 def show
 end
end
