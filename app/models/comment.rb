class Comment < ApplicationRecord
  #asociation
  belongs_to :user
  belongs_to :item
  #validation
  validates :text, null: false

end
