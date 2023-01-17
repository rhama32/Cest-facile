class Follow < ApplicationRecord
 has_many :follows, dependent: :destroy
 has_many :doctors, through: :follows
 has_many :customers, through: :follows
end
