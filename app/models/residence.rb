class Residence < ApplicationRecord
  # association
  belongs_to :user
  # validation
  validates :family_name, null: false
  validates :last_name, null: false
  validates :j_family_name, null: false
  validates :j_last_name, null: false
  validates :postcode, null: false
  validates :prefecture, null: false
  validates :city, null: false
  validates :block, null: false
end
