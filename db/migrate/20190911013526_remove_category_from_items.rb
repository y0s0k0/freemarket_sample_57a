class RemoveCategoryFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :category, :integer
  end
end
