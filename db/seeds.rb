# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 第一階層目
lady = Category.create(:name=>"レディース")
man = Category.create(:name=>"メンズ")
baby = Category.create(:name=>"ベビー・キッズ")
interior = Category.create(:name=>"インテリア・住まい・小物")
book= Category.create(:name=>"本・音楽・ゲーム")
hobby = Category.create(:name=>"おもちゃ・ホビー・グッズ")
cosmetics = Category.create(:name=>"コスメ・香水・美容")
appliance = Category.create(:name=>"家電・スマホ・カメラ")
sport = Category.create(:name=>"スポーツ・レジャー")
handmade = Category.create(:name=>"ハンドメイド")
ticket = Category.create(:name=>"チケット")
bicycle = Category.create(:name=>"自転車・オートバイ")
others = Category.create(:name=>"その他")

# 第二階層目
lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")
lady_pants = lady.children.create(:name=>"パンツ")
lady_skirt = lady.children.create(:name=>"スカート")
lady_dress = lady.children.create(:name=>"ワンピース")
lady_shoe = lady.children.create(:name=>"靴")
lady_roomware = lady.children.create(:name=>"ルームウェア/パジャマ")
lady_legware = lady.children.create(:name=>"レッグウェア")
lady_hat = lady.children.create(:name=>"帽子")
lady_bag = lady.children.create(:name=>"バッグ")
lady_accessory = lady.children.create(:name=>"アクセサリー")
lady_hair_accessory = lady.children.create(:name=>"ヘアアクセサリー")
lady_goods = lady.children.create(:name=>"小物")
lady_watch = lady.children.create(:name=>"時計")


# 第三階層目
lady_tops.children.create([
  {:name=>"Tシャツ/カットソー(半袖/袖なし)"}, 
  {:name=>"Tシャツ/カットソー(七分/長袖)"},
  {:name=>"半袖/袖なし"},
  {:name=>"シャツ/ブラウス(七分/長袖)"},
  {:name=>"ポロシャツ"},
  {:name=>"キャミソール"},
  {:name=>"タンクトップ"},
  {:name=>"ホルターネック"},
  {:name=>"ニット/セーター"},
  {:name=>"チュニック"},
  {:name=>"カーディガン/ボレロ"},
  {:name=>"アンサンブル"},
  {:name=>"ベスト/ジレ"},
  {:name=>"パーカー"}
])
lady_jacket.children.create([
  {:name=>"テーラードジャケット"},
  {:name=>"ノーカラージャケット"},
  {:name=>"Gジャン/デニムジャケット"},
  {:name=>"レザージャケット"},
  {:name=>"ダウンジャケット"},
  {:name=>"ライダーズジャケット"},
  {:name=>"ミリタリージャケット"},
  {:name=>"ダウンベスト"},
  {:name=>"ジャンパー/ブルゾン"},
  {:name=>"ポンチョ"},
  {:name=>"ロングコート"},
  {:name=>"トレンチコート"},
  {:name=>"ダッフルコート"},
  {:name=>"ピーコート"}
])
lady_pants.children.create([
  {:name=>"デニム/ジーンズ"},
  {:name=>"ショートパンツ"},
  {:name=>"カジュアルパンツ"},
  {:name=>"ハーフパンツ"},
  {:name=>"チノパン"},
  {:name=>"ワークパンツ/カーゴパンツ"},
  {:name=>"クロップドパンツ"},
  {:name=>"サロペット/オーバーオール"},
  {:name=>"オールインワン"},
  {:name=>"サルエルパンツ"},
  {:name=>"ガウチョパンツ"},
  {:name=>"その他"}
])
lady_skirt.children.create([
  {:name=>"ミニスカート"},
  {:name=>"ひざ丈スカート"},
  {:name=>"ロングスカート"},
  {:name=>"キュロット"},
  {:name=>"その他"}
])
lady_dress.children.create([
  {:name=>"ミニワンピース"},
  {:name=>"ひざ丈ワンピース"},
  {:name=>"ロングワンピース"},
  {:name=>"その他"}
])
lady_shoe.children.create([
  {:name=>"ハイヒール/パンプス"},
  {:name=>"ブーツ"},
  {:name=>"サンダル"},
  {:name=>"スニーカー"},
  {:name=>"ミュール"},
  {:name=>"モカシン"},
  {:name=>"ローファー/革靴"},
  {:name=>"フラットシューズ/バレエシューズ"},
  {:name=>"長靴/レインシューズ"},
  {:name=>"その他"}
])
lady_roomware.children.create([
  {:name=>"パジャマ"},
  {:name=>"ルームウェア"}
])
lady_legware.children.create([
  {:name=>"ソックス"},
  {:name=>"スパッツ/レギンス"},
  {:name=>"ストッキング/タイツ"},
  {:name=>"レッグウォーマー"},
  {:name=>"その他"}
])
