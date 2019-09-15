class RemoveItemIdFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :categories, :items
    remove_index :categories, :item_id
    remove_reference :categories, :item
  end
end
