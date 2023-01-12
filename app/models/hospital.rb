class Hospital < ApplicationRecord
 
 #画像を保存できるように記述
 has_one_attached :image
 
 #genreに対して多対１の記ÿ
 belongs_to :genre
end
