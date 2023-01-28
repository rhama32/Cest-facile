class Hospital < ApplicationRecord
 #画像を保存できるように記述
 has_one_attached :image
 
 #genreに対して多対１の記ÿ
 belongs_to :genre
 has_many :reviews
 has_many :doctors
 
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
  
   #Googleマップの記載
   geocoded_by :address
   after_validation :geocode, if: :address_changed?
end