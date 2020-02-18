class Comment < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :item
  #validation
  validates :text, presence: true

end
