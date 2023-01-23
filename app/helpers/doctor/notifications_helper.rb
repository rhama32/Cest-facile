module Doctor::NotificationsHelper
   def unchecked_notifications
    @notifications = doctor.passive_notifications.where(checked: false)
  end
end
