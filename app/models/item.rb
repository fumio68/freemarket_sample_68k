class Item < ApplicationRecord
  # association
  belongs_to :user
  # validation
  validates :name, null: false
  validates :price, null: false
  validates :content, null: false
  validates :condition, null: false
  validates :shipping, null: false
  validates :shipping_area, null: false
  validates :days_to_ship, null: false
  validates :status, null: false
end
