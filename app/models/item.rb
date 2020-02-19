class Item < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :category
  has_many :item_images
  accepts_nested_attributes_for :images, allow_destroy: true

  # validation
  validates :name,          presence: true
  validates :price,         presence: true
  validates :content,       presence: true
  validates :condition,     presence: true
  validates :shipping,      presence: true
  validates :shipping_area, presence: true
  validates :days_to_ship,  presence: true
  validates :status,        presence: true
end
