class Symptom < ApplicationRecord
  
  has_many :symptoms, foreign_key: 'symptom_id'
    #symptomは複数の症状を持つ。
  has_many :hospitals, through: :post_tags
  
  validates :personal_symptom, presence: true
end