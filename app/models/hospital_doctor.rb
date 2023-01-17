class HospitalDoctor < ApplicationRecord
 belongs_to :hospital, optional: true
 
end
