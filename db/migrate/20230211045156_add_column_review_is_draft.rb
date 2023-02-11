class AddColumnReviewIsDraft < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :is_draft, :boolean, default: true
  end
end