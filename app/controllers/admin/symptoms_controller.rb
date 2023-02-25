class Admin::SymptomsController < ApplicationController

#管理者でログインしていない場合、ログイン画面へ遷移。
before_action :authenticate_admin!

def index
  @symptoms = Symptom.all
  @symptom = Symptom.new
end

def create
  @symptom = Symptom.new(symptom_params)
  @symptom.save!
  redirect_to admin_symptoms_path
end

def edit
  @symptom = Symptom.find(params[:id])
end

def update
  @symptom = Symptom.find(params[:id])
  if @symptom.update(symptom_params)
    redirect_to admin_symptoms_path
  else
    render :edit
  end
end

private
  def symptom_params
    params.require(:symptom).permit(:personal_symptom)
  end

end