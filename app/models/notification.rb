class Notification < ApplicationRecord

  belongs_to :admin
  belongs_to :doctor
  
end
