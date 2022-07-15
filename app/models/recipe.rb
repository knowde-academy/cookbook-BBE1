class Recipe < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }
  validates :name, presence: true
  validates :video_link, url: true 
end
