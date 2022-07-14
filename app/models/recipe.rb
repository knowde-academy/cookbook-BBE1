class Recipe < ApplicationRecord
  validates :price, numericality: true
  validates :name, presence: true
end
