class CreateReservations < ActiveRecord::Migration[6.1]
  def change
   create_table :reservations do |t|
    t.integer :customer_id
    t.integer :hospital_id
    t.datetime :hope_day
    t.datetime :hope_time
    t.integer :status
    t.timestamps
    end
  end
end







