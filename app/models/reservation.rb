class Reservation < ApplicationRecord

  validates :customer_id, presence: true
  validates :hospital_id, presence: true
  validates :hope_day, presence: true
  validates :hope_time, presence: true

  belongs_to :hospital
  belongs_to :customer

  enum status: { reservation_confirmed: 0, tentative_reservation: 1, reception_cancellation: 2 }
end
