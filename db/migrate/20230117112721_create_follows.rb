class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :customer_id
      t.integer :doctor_id
      t.integer :hospital_id
      t.timestamps
    end
  end
end
