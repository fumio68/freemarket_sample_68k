class ItemImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  #association
  belongs_to :item
  #validation
  validates :image, presence: true
end
