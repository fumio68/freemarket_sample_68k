class Comment < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :item
  #validation
  validates :text, null: false

end
