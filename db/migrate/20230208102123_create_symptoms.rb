class CreateSymptoms < ActiveRecord::Migration[6.1]
  def change
    create_table :symptoms do |t|
      t.string :subject
      t.string :personal_symptom
      t.timestamps
    end
  end
end
