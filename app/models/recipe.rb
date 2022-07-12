class Recipe < ApplicationRecord
  validates :price, numericality: true
end
