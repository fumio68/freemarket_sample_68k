class ItemImage < ApplicationRecord
  mount_uploader :src, ImageUploader
  #association
  belongs_to :item
  #validation
  validates :image, presence: true
end
