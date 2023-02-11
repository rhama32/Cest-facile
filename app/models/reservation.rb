class Reservation < ApplicationRecord

  validates :customer_id, presence: true
  validates :hospital_id, presence: true
  validates :hope_day, presence: true
  validates :hope_time, presence: true
  validate :before_today
  validate :maximum_per_customer

  belongs_to :hospital
  belongs_to :customer

  enum status: { reservation_pending: 0, reservation_confirmed: 1, tentative_reservation: 2, reception_cancellation: 3 }
  
  def before_today
    errors.add(:hope_time, 'は、明日以降の予約をしてください。') if hope_time < Time.current
  end
  
  def maximum_per_customer
   errors.add(:reservation, 'は1人3件までとなります。') if customer.reservations.count >= 3
  end
  
end