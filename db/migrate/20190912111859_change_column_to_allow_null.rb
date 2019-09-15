class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]

  def up
    change_column :items, :transaction_condition, :integer, null: true
  end
  
  def down
    change_column :items, :transaction_condition, :integer, null: false
  end
end
