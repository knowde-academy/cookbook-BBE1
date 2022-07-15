class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :video_link, url: true 
end
