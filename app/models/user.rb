class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :companies
  has_many :stores, through: :companies

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
