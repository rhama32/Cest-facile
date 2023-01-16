class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :review_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
