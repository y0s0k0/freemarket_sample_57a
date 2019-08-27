class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :nickname, :string, null: false, unique: true
    add_column :email, :string, null: false, unique: true
    add_column :password, :string, null: false
    add_column :last_name, :string, null: false
    add_column :first_name, :string, null: false
    add_column :last_name_kana, :string, null: false 
    add_column :first_name_kana, :string, null: false 
    add_column :year, :integer, null: false
    add_column :month, :integer, null: false 
    add_column :day, :integer, null: false 
    add_column :phone_number, :integer, null: false 
    add_column :zip, :integer, null: false 
    add_column :prefecture, :string, null: false
    add_column :city, :string, null: false
    add_column :address, :string, null: false
    add_column :building, :string
    add_column :image, :string
    add_column :introduction, :string 
  end
end