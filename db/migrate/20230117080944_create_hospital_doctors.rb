class CreateHospitalDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :hospital_doctors do |t|
      t.integer :hospital_id
      t.string :email
      t.string :name
      t.string :encrypted_password
      t.boolean :is_deleted
      t.timestamps
    end
  end
end
