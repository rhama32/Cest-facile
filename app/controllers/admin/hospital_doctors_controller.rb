class Admin::HospitalDoctorsController < ApplicationController

#管理者でログインしていない場合、ログイン画面へ遷移。 
before_action :authenticate_admin!

def show
end

def edit
end

def update
end

def unsubscribe
end

def withdraw
end

end