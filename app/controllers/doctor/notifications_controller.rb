class Doctor::NotificationsController < ApplicationController
    
    def index
      @notificaitons = doctor.notifications
      @notifications.where(checked: false).each do |notification|
       notification.update_attributes(checked: true)
     end
    end
end