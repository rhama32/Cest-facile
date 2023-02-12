class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.integer :doctor_id
      t.integer :customer_id
      t.integer :review_id
      t.text :comment
      t.timestamps
    end
  end
end
