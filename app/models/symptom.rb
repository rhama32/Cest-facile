class Symptom < ApplicationRecord
  has_many :symptoms, foreign_key: 'symptom_id'
    #symptomは複数の症状を持つ。それはhospitalを通じて参照できる。
  has_many :hospitals, through: :post_tags

end