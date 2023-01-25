class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true, numericality: {only_integer: true}
  validates :address, presence: true
  validates :telephone_number, presence: true, numericality: {only_integer: true}

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follows, foreign_key: "customer_id", dependent: :destroy
  has_many :doctors, through: :follows
  # フォローしたときの処理
  def follow(doctor_id)
    follows.create(doctor_id: doctor_id)
  end
  # フォローを外すときの処理
  def unfollow(doctor_id)
    follows.find_by(doctor_id: doctor_id).destroy
  end
  # フォローしているか判定
  def following?(hospital_doctor)
    doctors.include?(hospital_doctor)
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    user = find_by(email: 'guest@example.com')
    unless user
      user = create!(
        email: 'guest@example.com',
        password: SecureRandom.urlsafe_base64,
        first_name: 'ゲスト',
        last_name: '太郎',
        first_name_kana: 'げすと',
        last_name_kana: 'たろう',
        postal_code: '1234567',
        address: '東京県渋谷市新宿区1-11-111',
        telephone_number: '09012345678'
      )
    end
    user.password = SecureRandom.urlsafe_base64
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("first_name LIKE? or last_name LIKE?", "#{word}","#{word}")
    elsif search == "forward_match"
      @customer = Customer.where("first_name LIKE? or last_name LIKE?", "#{word}%","#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("first_name LIKE? or last_name LIKE?", "%#{word}","%#{word}")
    elsif search == "partial_match"
      @customer = Customer.where("first_name LIKE? or last_name LIKE?", "%#{word}%","%#{word}%")
    else
      @customer = Customer.all
    end
  end
  
  def full_name
    "#{last_name}#{first_name}"
  end
end
