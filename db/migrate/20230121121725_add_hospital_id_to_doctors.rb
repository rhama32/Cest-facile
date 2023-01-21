class AddHospitalIdToDoctors < ActiveRecord::Migration[6.1]
  def change
   remove_column :doctors, :hospital_name, :string
   add_column :doctors, :hospital_id, :integer
  end
end
