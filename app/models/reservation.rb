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
  
  #予約機能についての制限
  def before_today
    errors.add(:hope_day, 'は、明日以降の予約をしてください。') if hope_day < Time.current
  end
  
  #予約機能についての制限
  def maximum_per_customer
   errors.add(:reservation, 'は1人3件までとなります。') if customer.reservations.where.not(hope_day: ..Time.current).count >= 3
  end
  
end