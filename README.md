# README
# mercari_var2 DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|birthday|date|null:false|
|password|string|null:false|
|email|string|null: false|
|tel|string|unique: true|
|nickname|string|null: false|
|icon|string||
|self_introduction|string||

### Association
- has_one :address
- has_one :credit
- has_many :exhibition_histories
- has_many :products
- has_many :purchase_histories
- has_many :buy_products


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_ID|integer|null:false, foreign_key: true|
|postal_code|string|null: false|
|prefecture_id(acitve_hash)|integer|null: false|
|municipalities|string|null: false|
|house_number|string|null: false|
|building|string||

### Association
- belongs_to :user


## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user_ID|integer|null:false, foreign_key: true|
|customer_ID(pay.jp)|string|null: false|
|card_ID(pay.jp)|string|null: false|

### Association
- belongs_to :user
- belongs_to :buy_product


## purchase_historiesテーブル
|Column|Type|Options|
|------|----|-------|
|buy_product_ID|integer|null:false,foreign_key: true|
|user_ID|integer|null:false, foreign_key: true|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :user
- has_many :buy_products


## exhibition_historiesテーブル
|Column|Type|Options|
|------|----|-------|
|product_ID|integer|null:false, foreign_key: true|
|user_ID|integer|null:false, foreign_key: true|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :user
- has_many :products


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_ID|integer|null:false, foreign_key: true|
|category_ID|integer|null:false,foreign_key: true|
|brand_ID|integer|null:false, foreign_key: true|
|prefecture_id(acitve_hash)|integer|null: false|
|name|string|null: false|
|description_of_item|text|null:false|
|commodity_condition|string|null: false|
|shipping_charges|string|null: false|
|days_until_shipping|string|null: false|
|price|string|null: false|
|image_ID|string|null:false,foreign_key:true|

### Association
- belongs_to :buy_product
- belongs_to :category
- belongs_to :brand
- belongs_to :exhibition_history
- belongs_to :user
- has_many :images


## buy_productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_ID|integer|null:false, foreign_key: true|
|user_ID|integer|null:false, foreign_key: true|
|credit_ID|integer|null:false, foreign_key: true|
|address_ID|integer|null:false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user
- belongs_to :credit
- belongs_to :purchase_history


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products
- has_ancestry


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_ID|integer|null: false,foreign_key: true|


### Association
- belongs_to :product
