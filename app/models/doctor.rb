class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :followers, class_name: 'Follow'
  has_many :customers, through: :followers
  has_many :notifications, dependent: :destroy
  belongs_to :hospital, optional: true

  enum approved_status: { unapproved: 1, approved: 2, denied: 3 }
  
  def save_notification_doctor!(current_admin)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = Notification.new(
      admin_id: current_admin.id, 
      doctor_id: self.id,
      action: '承認結果が届きました。結果の詳細内容については個別にお答え出来かねますのでご了承ください。'
    )
    notification.save if notification.valid?
  end
  
end