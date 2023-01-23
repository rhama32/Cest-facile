class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :doctor_id
      t.integer :admin_id
      t.string :action, default: ''
      t.boolean :checked, default: false
      t.timestamps
    end
  end
end
