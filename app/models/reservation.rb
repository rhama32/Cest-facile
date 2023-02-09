class Reservation < ApplicationRecord

  validates :customer_id, presence: true
  validates :hospital_id, presence: true
  validates :hope_day, presence: true
  validates :hope_time, presence: true
  validate :before_today

  belongs_to :hospital
  belongs_to :customer

  enum status: { reservation_pending: 0, reservation_confirmed: 1, tentative_reservation: 2, reception_cancellation: 3 }
  
  def before_today
    errors.add(:hope_day, 'は、本日以降の予約をしてください。') if hope_day < Date.today
  end
end
