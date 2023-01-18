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
  has_many :follows, foreign_key: "customer_id"
  has_many :doctors, through: :follows

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
end
