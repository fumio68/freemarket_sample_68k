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
|shipping|string|null: false|
|shipping_area|string|null: false|
|days_to_ship|string|null: false|
|shipping_method|string|null: false|
|status|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :items_image
- has_many :item_categories
- has_many :categories,  through:  :item_categories
- has_many :comments
- has_many :favorites
- belongs_to :user
- belongs_to :purchase