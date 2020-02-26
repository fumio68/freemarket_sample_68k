# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 第一階層目
lady = Category.create(name: "レディース")
man = Category.create(name: "メンズ")
baby = Category.create(name: "ベビー・キッズ")
interior = Category.create(name: "インテリア・住まい・小物")
book= Category.create(name: "本・音楽・ゲーム")
hobby = Category.create(name: "おもちゃ・ホビー・グッズ")
cosmetics = Category.create(name: "コスメ・香水・美容")
appliance = Category.create(name: "家電・スマホ・カメラ")
sport = Category.create(name: "スポーツ・レジャー")
handmade = Category.create(name: "ハンドメイド")
ticket = Category.create(name: "チケット")
bicycle = Category.create(name: "自転車・オートバイ")
others = Category.create(name: "その他")

# 第二階層目レディース
lady_tops = lady.children.create(name: "トップス")
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_pants = lady.children.create(name: "パンツ")
lady_skirt = lady.children.create(name: "スカート")
lady_dress = lady.children.create(name: "ワンピース")
lady_shoe = lady.children.create(name: "靴")
lady_roomware = lady.children.create(name: "ルームウェア/パジャマ")
lady_legware = lady.children.create(name: "レッグウェア")
lady_hat = lady.children.create(name: "帽子")
lady_bag = lady.children.create(name: "バッグ")
lady_accessory = lady.children.create(name: "アクセサリー")
lady_hair_accessory = lady.children.create(name: "ヘアアクセサリー")
lady_goods = lady.children.create(name: "小物")
lady_watch = lady.children.create(name: "時計")

# 第三階層目
lady_tops_kinds = lady_tops.children.create([
                  {name: "Tシャツ/カットソー(半袖/袖なし)"}, 
                  {name: "Tシャツ/カットソー(七分/長袖)"},
                  {name: "半袖/袖なし"},
                  {name: "シャツ/ブラウス(七分/長袖)"},
                  {name: "ポロシャツ"},
                  {name: "キャミソール"},
                  {name: "タンクトップ"},
                  {name: "ホルターネック"},
                  {name: "ニット/セーター"},
                  {name: "チュニック"},
                  {name: "カーディガン/ボレロ"},
                  {name: "アンサンブル"},
                  {name: "ベスト/ジレ"},
                  {name: "パーカー"}
                ])
# 第三階層目レディース
lady_tops.children.create([
  {name: "Tシャツ/カットソー(半袖/袖なし)"}, 
  {name: "Tシャツ/カットソー(七分/長袖)"},
  {name: "半袖/袖なし"},
  {name: "シャツ/ブラウス(七分/長袖)"},
  {name: "ポロシャツ"},
  {name: "キャミソール"},
  {name: "タンクトップ"},
  {name: "ホルターネック"},
  {name: "ニット/セーター"},
  {name: "チュニック"},
  {name: "カーディガン/ボレロ"},
  {name: "アンサンブル"},
  {name: "ベスト/ジレ"},
  {name: "パーカー"}
])
lady_jacket.children.create([
  {name: "テーラードジャケット"},
  {name: "ノーカラージャケット"},
  {name: "Gジャン/デニムジャケット"},
  {name: "レザージャケット"},
  {name: "ダウンジャケット"},
  {name: "ライダーズジャケット"},
  {name: "ミリタリージャケット"},
  {name: "ダウンベスト"},
  {name: "ジャンパー/ブルゾン"},
  {name: "ポンチョ"},
  {name: "ロングコート"},
  {name: "トレンチコート"},
  {name: "ダッフルコート"},
  {name: "ピーコート"}
])
lady_pants.children.create([
  {name: "デニム/ジーンズ"},
  {name: "ショートパンツ"},
  {name: "カジュアルパンツ"},
  {name: "ハーフパンツ"},
  {name: "チノパン"},
  {name: "ワークパンツ/カーゴパンツ"},
  {name: "クロップドパンツ"},
  {name: "サロペット/オーバーオール"},
  {name: "オールインワン"},
  {name: "サルエルパンツ"},
  {name: "ガウチョパンツ"},
  {name: "その他"}
])
lady_skirt.children.create([
  {name: "ミニスカート"},
  {name: "ひざ丈スカート"},
  {name: "ロングスカート"},
  {name: "キュロット"},
  {name: "その他"}
])
lady_dress.children.create([
  {name: "ミニワンピース"},
  {name: "ひざ丈ワンピース"},
  {name: "ロングワンピース"},
  {name: "その他"}
])
lady_shoe.children.create([
  {name: "ハイヒール/パンプス"},
  {name: "ブーツ"},
  {name: "サンダル"},
  {name: "スニーカー"},
  {name: "ミュール"},
  {name: "モカシン"},
  {name: "ローファー/革靴"},
  {name: "フラットシューズ/バレエシューズ"},
  {name: "長靴/レインシューズ"},
  {name: "その他"}
])
lady_roomware.children.create([
  {name: "パジャマ"},
  {name: "ルームウェア"}
])
lady_legware.children.create([
  {name: "ソックス"},
  {name: "スパッツ/レギンス"},
  {name: "ストッキング/タイツ"},
  {name: "レッグウォーマー"},
  {name: "その他"}
])

# 第四階層目
lady_tops_kinds.each do |size|
  size.children.create([
    {name: "XXS以下"},
    {name: "XS(SS)"},
    {name: "S"},
    {name: "M"},
    {name: "L"},
    {name: "XL(LL)"},
    {name: "2XL(3L)"},
    {name: "3XL(4L)"},
    {name: "4XL(5L)以上"},
    {name: "FREE SIZE"},
  ])
end
lady_hat.children.create([
  {name: "ニットキャップ/ビーニー"},
  {name: "ハット"},
  {name: "ハンチング/ベレー帽"},
  {name: "キャップ"},
  {name: "キャスケット"},
  {name: "麦わら帽子"},
  {name: "その他"}
])
lady_bag.children.create([
  {name: "ハンドバッグ"},
  {name: "トートバッグ"},
  {name: "エコバッグ"},
  {name: "リュック/バックパック"},
  {name: "ボストンバッグ"},
  {name: "スポーツバッグ"},
  {name: "クラッチバッグ"},
  {name: "ポーチ/バニティ"},
  {name: "ボディバッグ/ウェストバッグ"},
  {name: "マザーズバッグ"},
  {name: "メッセンジャーバッグ"},
  {name: "ビジネスバッグ"},
  {name: "旅行用バッグ/キャリーバッグ"}
])
lady_accessory.children.create([
  {name: "ネックレス"},
  {name: "ブレスレット"},
  {name: "バングル/リストバンド"},
  {name: "リング"},
  {name: "ピアス（片耳用）"},
  {name: "ピアス（両耳用）"},
  {name: "イヤリング"},
  {name: "アンクレット"},
  {name: "ブローチ/コサージュ"},
  {name: "チャーム"}
])
lady_hair_accessory.children.create([
  {name: "ヘアゴム/シュシュ"},
  {name: "ヘアバンド/カチューシャ"},
  {name: "ヘアピン"},
  {name: "その他"}
])
lady_goods.children.create([
  {name: "長財布"},
  {name: "折り財布"},
  {name: "コインケース/小銭入れ"},
  {name: "名刺入れ/定期入れ"},
  {name: "キーケース"},
  {name: "キーホルダー"},
  {name: "手袋/アームカバー"},
  {name: "ハンカチ"},
  {name: "ベルト"},
  {name: "マフラー/ショール"},
  {name: "ストール/スヌード"},
  {name: "バンダナ/スカーフ"},
  {name: "ネックウォーマー"},
  {name: "サスペンダー"}
])
lady_watch.children.create([
  {name: "腕時計（アナログ）"},
  {name: "腕時計（デジタル）"},
  {name: "ラバーベルト"},
  {name: "レザーベルト"},
  {name: "金属ベルト"},
  {name: "その他"}
])

# 第二階層目メンズ
man_tops = man.children.create(name: "トップス")
man_jacket = man.children.create(name: "ジャケット/アウター")
man_pants = man.children.create(name: "パンツ")
man_shoe = man.children.create(name: "靴")
man_bag = man.children.create(name: "バッグ")
man_suit = man.children.create(name: "スーツ")
man_hat = man.children.create(name: "帽子")
man_accessory = man.children.create(name: "アクセサリー")
man_goods = man.children.create(name: "小物")
man_watch = man.children.create(name: "時計")
man_swimsuit = man.children.create(name: "水着")
man_legware = man.children.create(name: "レッグウェア")
man_underware = man.children.create(name: "アンダーウェア")
man_other = man.children.create(name: "その他")

# 第三階層目メンズ
man_tops.children.create([
  {name: "Tシャツ/カットソー(半袖/袖なし)"}, 
  {name: "Tシャツ/カットソー(七分/長袖)"},
  {name: "シャツ"},
  {name: "ポロシャツ"},
  {name: "タンクトップ"},
  {name: "ニット/セーター"},
  {name: "パーカー"},
  {name: "カーディガン"},
  {name: "スウェット"},
  {name: "ジャージ"},
  {name: "ベスト"},
  {name: "その他"}
])
man_jacket.children.create([
  {name: "テーラードジャケット"},
  {name: "ノーカラージャケット"},
  {name: "Gジャン/デニムジャケット"},
  {name: "レザージャケット"},
  {name: "ダウンジャケット"},
  {name: "ライダースジャケット"},
  {name: "ミリタリージャケット"},
  {name: "ナイロンジャケット"},
  {name: "フライトジャケット"},
  {name: "ダッフルコート"},
  {name: "ピーコート"},
  {name: "ステンカラーコート"},
  {name: "トレンチコート"},
  {name: "モッズコート"}
])
man_pants.children.create([
  {name: "デニム/ジーンズ"},
  {name: "ワークパンツ/カーゴパンツ"},
  {name: "スラックス"},
  {name: "チノパン"},
  {name: "ショートパンツ"},
  {name: "ペインターパンツ"},
  {name: "サルエルパンツ"},
  {name: "オーバーオール"},
  {name: "その他"}
])
# man_shoe.create
# man_bag.create
# man_suit.create
# man_hat.create
# man_accessory.create
# man_goods.create
# man_watch.create
# man_swimsuit.create
# man_legware.create
# man_underware.create
# man_other .create
