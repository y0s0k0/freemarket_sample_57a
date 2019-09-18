class AddColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :seller_id, :integer
    add_column :items, :buyer_id, :integer
    add_foreign_key :items, :users, column: :seller_id
    add_foreign_key :items, :users, column: :buyer_id
  end
end
