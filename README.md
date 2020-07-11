# README
# mercari_var2 DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|birthday|date|null:false|
|password|string|null:false|
|tel|string|unique: true|
|address_ID|integer|foreign_key: true|
|credit_ID|integer|foreign_key: true|
|nickname|string|null: false|
|icon|string||
|self_introduction|string||

### Association
- belongs_to :address
- belongs_to :credit
- has_many :exhibition_histories
- has_many :product, through :products_users_comments
- has_many :products
- has_many :purchase_histories
- has_many :buy_products

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_ID|integer|foreign_key: true|
|postal_code|string|null: false|
|area_ID|integer|foreign_key: true|
|municipalities|string|null: false|
|house_number|string|null: false|
|building|string||


### Association
- belongs_to :user
- belongs_to :area


## areasテーブル
|Column|Type|Options|
|------|----|-------|
|prefecturese|string|null: false|


### Association
- has_many :addresses
- has_many :products



## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|card_number|integer|null: false|
|expiration_date_month|integer|null: false|
|expiration_date_day|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user
- belongs_to :buy_products


## purchase_historiesテーブル
|Column|Type|Options|
|------|----|-------|
|buy_product_ID|integer|foreign_key: true|
|user_ID|integer|foreign_key: true|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|


### Association
- belongs_to :user
- has_many :buy_products

## exhibition_historiesテーブル
|Column|Type|Options|
|------|----|-------|
|product_ID|integer|foreign_key: true|
|user_ID|integer|foreign_key: true|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|


### Association
- belongs_to :user
- has_many :products

## product_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_ID|integer|foreign_key: true|
|comments|string|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|


### Association
- belongs_to :user
- belongs_to :product

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_ID|integer|foreign_key: true|
|category_ID|integer|foreign_key: true|
|brand_ID|integer|foreign_key: true|
|image|string|null: false|
|product_name|string|null: false|
|description_of_item|text|null:false|
|commodity_condition|string|null: false|
|shipping_charges|string|null: false|
|area_ID|integer|null: false|
|days_until_shipping|string|null: false|
|price|string|null: false|
|comment|string|foreign_key: true|


### Association
- belongs_to :buy_product
- belongs_to :categoriy
- belongs_to :brand
- belongs_to :area
- belongs_to :exhibition_history
- belongs_to :user
- has_many :users, through: :products_users_comments


## buy_productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_ID|integer|foreign_key: true|
|user_ID|integer|foreign_key: true|
|credit_ID|integer|foreign_key: true|
|address_ID|integer|foreign_key: true|



### Association
- belongs_to :product
- belongs_to :user
- belongs_to :credit
- belongs_to :purchase_histories



## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|


### Association
- has_many :products

## brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string|null: false|


### Association
- has_many :products

## products_users_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_comment|string|foreign_key: true|
|products_comment|string|foreign_key: true|
|created_at|string|null: false|
|updated_at|string|null: false|


### Association
- belongs_to :user
- belongs_to :product
