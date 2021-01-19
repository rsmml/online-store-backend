class Product < ApplicationRecord
  belongs_to :store
  has_many_attached :photos
  validates :title, :price, :description, :stock, presence: true
end
