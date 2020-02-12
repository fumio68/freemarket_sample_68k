# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
|b_year|string|null: false|
|b_month|string|null: false|
|b_date|string|null: false|
|user_image|string|null: false|
### Association
- has_many :items
- has_many :credits
- has_many :purchases
- has_many :comments
- has_many :favorites
- belongs_to :favorites

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|content|text|null: false|
|brand|string||
|condition|string|null: false|
|shipping|string|null: false| <!-- stringの方がわかりやすいと思い、integer型から変更しています -->
|shipping_area|string|null: false|
|days_to_ship|string|null: false|
|shipping_method|string|null: false|
|status|string|null: false| <!-- コメント同上 -->
|user_id|references|null: false, foreign_key: true|<!-- 外部キーはreferences型に統一しています -->
### Association
- has_many :items_image
- has_many :items_categories
- has_many :categories,  through:  :items_categories
- has_many :comments
- has_many :favorites
- belongs_to :user
- belongs_to :purchase

## items_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
- belongs_to :user
- belongs_to :group

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|kind|string|null: false|<!-- テーブル名とカラム名が重複していたため、カラム名を変更してみました -->
### Association
- has_many :items_categories
- has_many :items,  through:  :items_categories

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
- belongs_to :items



