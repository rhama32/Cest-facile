class Doctor::FollowersController < ApplicationController
 
  #医療者でログインしていない場合、ログイン画面へ遷移。
  before_action :authenticate_doctor!
  
  def index
    @doctor = current_doctor
    @followers = Follow.all
  end

end