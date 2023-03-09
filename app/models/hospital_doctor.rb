class HospitalDoctor < ApplicationRecord
  
  belongs_to :hospital, optional: true
  belongs_to :doctor
  
  # フォローしているか判定
  def following?(customer_id)
    followings.include?(customer_id)
  end
end