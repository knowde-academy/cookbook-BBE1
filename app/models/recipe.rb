class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :cooking_time, numericality: { only_integer: true, greater_than: 0 }
  validates :video_link, url: { allow_blank: true }
end
