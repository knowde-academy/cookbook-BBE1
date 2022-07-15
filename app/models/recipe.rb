class Recipe < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }
  validates :name, presence: true
  validates :video_link, url: { allow_blank: true }
  validates :cooking_time, numericality: { only_integer: true, greater_than: 0 }
end
