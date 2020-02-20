class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # association
  has_many :items
  has_one :residence
  # validation
  validates :nickname,           presence: true
  validates :email,              presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]/i}
  validates :encrypted_password, presence: true, length: { minimum: 7 }
  validates :family_name,        presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :last_name,          presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :j_family_name,      presence: true, format: { with: /\A[ぁ-ん]/ }
  validates :j_last_name,        presence: true, format: { with: /\A[ぁ-ん]/ }
  validates :b_year,             presence: true
  validates :b_month,            presence: true
  validates :b_date,             presence: true
end
