class CreateHospitals < ActiveRecord::Migration[6.1]
  def change
    create_table :hospitals do |t|
 #テーブルのカラムを記載
 t.integer :genre_id, foreign_key: true, null: false
 t.string :name, null: false
 t.string :hospital_name_kana, null: false
 t.text :introduction, null: false
 t.string :subject, null: false
 t.string :hospital_time, null: false
 t.string :postal_code, null: false
 t.string :telephone_number, null: false
 t.boolean :is_active, default: true, null: false
 t.text :parking, null: false
 t.timestamps
  end
 end
end