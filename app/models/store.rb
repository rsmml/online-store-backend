class Store < ApplicationRecord
  has_many :companies, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
