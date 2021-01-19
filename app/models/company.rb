class Company < ApplicationRecord
  belongs_to :user
  belongs_to :store

  validates :name, presence: true, uniqueness: true
end
