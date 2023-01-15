class Review < ApplicationRecord

  validates :customer_id, presence: true
  validates :hospital_id, presence: true
  validates :doctor_satisfaction, presence: true
  validates :room_clean, presence: true
  validates :staff_satisfaction, presence: true
  validates :waiting_time, presence: true
  validates :comment, presence: true
  validates :total_point, presence: true

  belongs_to :hospital
end
