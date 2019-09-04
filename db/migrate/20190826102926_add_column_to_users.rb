class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string, null: false, unique: true
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name_kana, :string, null: false 
    add_column :users, :first_name_kana, :string, null: false 
    add_column :users, :year, :integer, null: false
    add_column :users, :month, :integer, null: false 
    add_column :users, :day, :integer, null: false 
    add_column :users, :phone_number, :integer, null: false 
    add_column :users, :zip, :integer, null: false 
    add_column :users, :prefecture, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :building, :string
    add_column :users, :image, :string
    add_column :users, :introduction, :string 
  end
end