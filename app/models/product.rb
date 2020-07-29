class Product < ApplicationRecord
  # アクティブハッシュ引用の記載
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  
  # belongs_to :buy_product
  belongs_to :category
  belongs_to :brand
  # belongs_to :exhibition_history
  # belongs_to :user
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images , allow_destroy: true
  accepts_nested_attributes_for :brand

  validates :name, :description_of_item ,:commodity_condition,
            :shipping_charges,:prefecture_id, :days_until_shipping,:price  ,presence: true
end
