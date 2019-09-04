class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string   :name, null: false, index: true
      t.string   :image, null: false
      t.string   :description, null: false
      t.integer  :category, null: false
      t.integer  :size
      t.integer  :brand
      t.integer  :condition, null: false
      t.integer  :postage, null: false
      t.integer  :region, null: false
      t.integer  :days, null: false
      t.integer  :price, null: false
      t.integer  :transaction_condition, null: false
      t.integer  :user_id, null: false, foreign_key: true
      t.timestamps 
    end
  end
end
