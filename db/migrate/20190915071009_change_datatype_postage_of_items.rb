class ChangeDatatypePostageOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :postage, :string
  end
end
