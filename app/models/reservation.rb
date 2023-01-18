class Reservation < ApplicationRecord

  validates :customer_id, presence: true
  validates :hospital_id, presence: true
  validates :hope_day, presence: true
  validates :hope_time, presence: true
  validates :status, presence: true

  belongs_to :hospital
  belongs_to :customer
end
