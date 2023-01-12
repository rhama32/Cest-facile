class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :hospital_id
      #満足度などは★で５段階評価
      t.integer :doctor_satisfaction
      t.integer :room_clean
      t.integer :staff_satisfaction
      t.integer :waiting_time
      t.text :comment
      t.integer :total_point
      t.timestamps
    end
  end
end