class Doctor::NotificationsController < ApplicationController

  #医療者でログインしていない場合、ログイン画面へ遷移。
  before_action :authenticate_doctor!
  
  def index
    @notifications = current_doctor.notifications.where(checked: false)
    if @notificaitons.blank?
      @notifications.each do |notification|
      notification.update(checked: true)
      end
    end
  end

end