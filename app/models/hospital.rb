class Hospital < ApplicationRecord
 #画像を保存できるように記述
 has_one_attached :image
 
 #genreに対して多対１の記述
 belongs_to :genre
 has_many :reviews
 has_many :doctors
 has_many :reservations


   # 検索方法分岐
  def self.looks(word)
      @hospital = Hospital.where("name LIKE?","%#{word}%")
  end
  
  def self.address_looks(word)
      @hospital = Hospital.where( "address LIKE ?", "%#{word}%")
  end
  
   #Googleマップの記載
   geocoded_by :address
   after_validation :geocode, if: :address_changed?
   
    #PV数計測
    is_impressionable
end