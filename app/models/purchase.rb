class Purchase < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :item
  #validation
  validates :postcode,   presence: true
  validates :prefecture, presence: true
  validates :city,       presence: true
  validates :block,      presence: true
end
