class AddDoctorIdToHospitalDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :hospital_doctors, :doctor_id, :integer
  end
end
