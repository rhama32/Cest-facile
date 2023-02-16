class Genre < ApplicationRecord

 #病院に対して1対多になるように記述
  has_many :hospitals, dependent: :destroy
  validates :name, presence: true

end