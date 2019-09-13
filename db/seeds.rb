# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 100.times do |index|
#     Item.create(name: "タイトル#{index}", image: "https://static.mercdn.net/thumb/photos/m78422326439_1.jpg?1567068061", description: "ブログの内容#{index}", category: "カテゴリー#{index}", size: "#{index}",brand: "#{index}", condition: "#{index}", postage: "#{index}", region: "#{index}", days: "#{index}", price: "#{index}", transaction_condition: "#{index}", user_id: "#{index}")
#   end

lady = Category.create(:name=>"レディース")

lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")

lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])