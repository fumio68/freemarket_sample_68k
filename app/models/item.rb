class Item < ApplicationRecord
  # association
  belongs_to :user
  has_many :item_images
  belongs_to :category

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
