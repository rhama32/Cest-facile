class Doctor::NotificationsController < ApplicationController
    
    def index
      @notifications = current_doctor.notifications.where(checked: false)
      if @notificaitons.blank?
      @notifications.each do |notification|
      notification.update(checked: true)
      end
    end
end
end