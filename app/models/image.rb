class Image < ApplicationRecord

  belongs_to :product
  has_many :categories, through: :products

  mount_uploader :image, ImageUploader

  validates :image, presence: true
end
