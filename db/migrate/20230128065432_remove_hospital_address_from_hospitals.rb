class RemoveHospitalAddressFromHospitals < ActiveRecord::Migration[6.1]
  def change
    remove_column :hospitals, :hospital_address, :string
  end
end
