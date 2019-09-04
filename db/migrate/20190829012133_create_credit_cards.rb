class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :card_number, null: false
      t.integer :month, null: false
      t.integer :year, null: false
      t.integer :security_code, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
