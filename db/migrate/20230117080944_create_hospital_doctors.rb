class CreateHospitalDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :hospital_doctors do |t|
      t.integer :hospital_id
      t.string :email
      t.string :name
      t.string :encrypted_password
      t.timestamps
    end
  end
end
