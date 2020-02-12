class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # association
  has_many :items
  # validation
  validates :nickname, null: false
  validates :email, null: false
  validates :encrypted_password, null: false
  validates :family_name, null: false
  validates :last_name, null: false
  validates :j_family_name, null: false
  validates :j_last_name, null: false
  validates :b_year, null: false
  validates :b_month, null: false
  validates :b_date, null: false
end
