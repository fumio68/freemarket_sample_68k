class Residence < ApplicationRecord

  # association
  belongs_to :user

  # validation
  validates :family_name,        presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :last_name,          presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :j_family_name,      presence: true, format: { with: /\A[ぁ-ん]/ }
  validates :j_last_name,        presence: true, format: { with: /\A[ぁ-ん]/ }
  validates :postcode,           presence: true
  validates :prefecture,         presence: true
  validates :city,               presence: true
  validates :block,              presence: true
  
end
