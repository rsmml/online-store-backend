class Product < ApplicationRecord
  belongs_to :store

  validates :title, :price, :description, :stock, presence: true
end
