class Doctor::FollowsController < ApplicationController

 def index
   @follows = Follow.all
   #一覧表示のフォロワー数
   @count = 0
   @follows.each do |follow|
   @count = @count + 1
    end
 end

 def show
 end

 def create
 end

 def destroy
 end
end
