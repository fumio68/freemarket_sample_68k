class ItemImage < ApplicationRecord
  #association
  belongs_to :item
  #validation
  validates :image, presence: true
end
