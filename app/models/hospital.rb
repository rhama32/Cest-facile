class Hospital < ApplicationRecord
    
  #画像を保存できるように記述
  has_one_attached :image

  #genreに対して多対１の記述
  belongs_to :genre
  has_many :reviews
  has_many :doctors
  has_many :reservations

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  #検索方法分岐
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