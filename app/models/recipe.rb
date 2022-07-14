class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :cooking_time, numericality: { only_integer: true, greater_than: 0}
end
