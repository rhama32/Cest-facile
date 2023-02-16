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
  belongs_to :customer
  has_many :favorites,dependent: :destroy
  has_many :replies
  
  scope :published, -> { where(is_draft: false) }

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      Review.where("comment LIKE?","#{word}")
    elsif search == "forward_match"
      Review.where("comment LIKE?","#{word}%")
    elsif search == "backward_match"
      Review.where("comment LIKE?","%#{word}")
    elsif search == "partial_match"
      Review.where("comment LIKE?","%#{word}%")
    else
      Review.all
    end
  end
  
  def customer_full_name
    customer.full_name 
  end

end
