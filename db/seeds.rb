# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do |index|
    index= index+1
    Item.create(name: "タイトル#{index}", description: "ブログの内容#{index}", size: "#{index}",brand: "#{index}", condition: 1.to_i, postage: 1.to_i, region: 1.to_i, days: 1.to_i, price: 1.to_i, transaction_condition: 1.to_i, user_id: 1.to_i)
end

100.times do |index|
  index= index+1
  ItemImage.create(image: "https://static.mercdn.net/thumb/photos/m78422326439_1.jpg?1567068061",item_id:"#{index}")
end

    # lady = Category.create(:name=>"レディース")

  # lady_tops = lady.children.create(:name=>"トップス")
  # lady_jacket = lady.children.create(:name=>"ジャケット/アウター")

  # lady_tops.children.create([{:name=>"すべて"},{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"シャツ/ブラウス(半袖/袖なし)"},{:name=>"シャツ/ブラウス(七分/長袖)"},{:name=>"ポロシャツ"},{:name=>"キャミソール"},{:name=>"タンクトップ"},{:name=>"ホルターネック"},{:name=>"チュニック"},{:name=>"カーディガン/ボレロ"},{:name=>"アンサンブル"},{:name=>"ベスト/ジレ"},{:name=>"パーカー"},{:name=>"トレーナー/スウェット"},{:name=>"ベアトップ/チューブトップ"},{:name=>"ジャージ"},{:name=>"その他"}])
  # lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])

  # mens = Category.create(:name=>"メンズ")

  # mens_tops = mens.children.create(:name=>"トップス")
  # mens_jacket = mens.children.create(:name=>"ジャケット/アウター")

  # mens_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"シャツ/ブラウス(半袖/袖なし)"},{:name=>"シャツ/ブラウス(七分/長袖)"},{:name=>"ポロシャツ"},{:name=>"キャミソール"},{:name=>"タンクトップ"},{:name=>"ホルターネック"},{:name=>"チュニック"},{:name=>"カーディガン/ボレロ"},{:name=>"アンサンブル"},{:name=>"ベスト/ジレ"},{:name=>"パーカー"},{:name=>"トレーナー/スウェット"},{:name=>"ベアトップ/チューブトップ"},{:name=>"ジャージ"},{:name=>"その他"}])
  # mens_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])

  # baby = Category.create(:name=>"ベビー・キッズ")

  # baby_tops = baby.children.create(:name=>"トップス")
  # baby_jacket = baby.children.create(:name=>"ジャケット/アウター")

  # baby_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"シャツ/ブラウス(半袖/袖なし)"},{:name=>"シャツ/ブラウス(七分/長袖)"},{:name=>"ポロシャツ"},{:name=>"キャミソール"},{:name=>"タンクトップ"},{:name=>"ホルターネック"},{:name=>"チュニック"},{:name=>"カーディガン/ボレロ"},{:name=>"アンサンブル"},{:name=>"ベスト/ジレ"},{:name=>"パーカー"},{:name=>"トレーナー/スウェット"},{:name=>"ベアトップ/チューブトップ"},{:name=>"ジャージ"},{:name=>"その他"}])
  # baby_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])

  

  # interior = Category.create(:name=>"インテリア・住まい・小物")

  # interior_tops = interior.children.create(:name=>"トップス")
  # interior_jacket = interior.children.create(:name=>"ジャケット/アウター")

  # interior_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"シャツ/ブラウス(半袖/袖なし)"},{:name=>"シャツ/ブラウス(七分/長袖)"},{:name=>"ポロシャツ"},{:name=>"キャミソール"},{:name=>"タンクトップ"},{:name=>"ホルターネック"},{:name=>"チュニック"},{:name=>"カーディガン/ボレロ"},{:name=>"アンサンブル"},{:name=>"ベスト/ジレ"},{:name=>"パーカー"},{:name=>"トレーナー/スウェット"},{:name=>"ベアトップ/チューブトップ"},{:name=>"ジャージ"},{:name=>"その他"}])
  # interior_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])


  # book = Category.create(:name=>"本・音楽・ゲーム")

  # toy = Category.create(:name=>"おもちゃ・ホビー・グッズ")

  # cosme= Category.create(:name=>"コスメ・香水・美容
  # ")

  # el = Category.create(:name=>"家電・スマホ・カメラ")

  # sport = Category.create(:name=>"スポーツ・レジャー")

  # handmade = Category.create(:name=>"ハンドメイド")

  # ticket = Category.create(:name=>"チケット")

  # car = Category.create(:name=>"自動車・オートバイ")

  # other = Category.create(:name=>"その他")


  lady = Category.create(:name=>"レディース",:item_id=>"1")

  lady_tops = lady.children.create(:name=>"トップス",:item_id=>"1")

  lady_tops.children.create(:name=>"Tシャツ/カットソー(半袖/袖なし)",:item_id=>"1")