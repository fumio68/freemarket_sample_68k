# README




# freemarket_sample_68k DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|last_name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|b_year|integer|null: false|
|b_month|integer|null: false|
|b_date|integer|null: false|
|user_image|string||
### Association
- has_many :items
- has_many :cards
- has_many :purchases
- has_one :residence

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|content|text|null: false|
|brand|string||
|condition|string|null: false|
|shipping|string|null: false|
|shipping_area|string|null: false|
|days_to_ship|string|null: false|
|shipping_method|string|null: false|
|status|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id_1|integer|null: false|
|category_id_2|integer|null: false|
|category_id_3|integer|null: false|
|size_id|integer||
|category_id|references|null: false, foreign_key: true|
### Association
- has_many :item_images
- belongs_to :user
- belongs_to :category
- has_one :purchase

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items
- has_ancestry

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|postcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string||
### Association
- belongs_to :user
- belongs_to :item

## residencesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|last_name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|postcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user
