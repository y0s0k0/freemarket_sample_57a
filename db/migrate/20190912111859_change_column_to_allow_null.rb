class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]

  def up
    change_column :items, :transaction_condition, :integer, null: true
    change_column :categories, :item_id, :integer, null: true
  end
  
  def down
    change_column :items, :transaction_condition, :integer, null: false
    change_column :categories, :item_id, :integer, null: false
  end
end
