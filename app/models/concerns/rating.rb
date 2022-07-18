class Rating < ApplicationRecord
  belongs_to :recipe

  validates :rate, allow_nil: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
