class Reservation < ApplicationRecord
  validates :reservation_id, presence: true
  validates :customer_id, presence: true
  validates :hospital_id, presence: true
  validates :hope_day, presence: true
  validates :hope_time, presence: true
  validates :status, presence: true
end
