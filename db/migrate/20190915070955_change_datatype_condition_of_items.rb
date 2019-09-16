class ChangeDatatypeConditionOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :condition, :string
  end
end
