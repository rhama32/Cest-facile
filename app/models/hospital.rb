class Hospital < ApplicationRecord
 #画像を保存できるように記述
 has_one_attached :image
 
 #genreに対して多対１の記ÿ
 belongs_to :genre
 has_many :reviews
 has_many :doctors
 has_many :reservations

 #タグ機能
 belongs_to :hospital
 belongs_to :symptom
 validates :hospital_id, presence: true
 validates :symptom_id, presence: true
 
 # タグのリレーションのみ記載
 has_many :hospitals
 has_many :symptoms, through: :hospitals

   # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @hospital = Hospital.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @hospital = Hospital.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @hospital = Hospital.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @hospital = Hospital.where("name LIKE?","%#{word}%")
    else
      @hospital = Hospital.all
    end
  end
  
  def self.address_looks(search,word)
    if search == "forward_match"
      @hospital = Hospital.where( "address LIKE ?", "#{word}%")
    elsif search == "perfect_match"
      @hospital = Hospital.where( "address LIKE ?", "#{word}") 
    elsif search == "partial_match"
      @hospital = Hospital.where( "address LIKE ?", "%#{word}%")
    elsif search == "backward_match"
      @hospital = Hospital.where( "address LIKE ?", "%#{word}")
    else
      @hospital = Hospital.all
    end
  end
  
   #Googleマップの記載
   geocoded_by :address
   after_validation :geocode, if: :address_changed?
end