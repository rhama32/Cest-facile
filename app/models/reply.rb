class Reply < ApplicationRecord
  
  belongs_to :doctor, optional: true
  belongs_to :customer, optional: true
  belongs_to :review
  
end
