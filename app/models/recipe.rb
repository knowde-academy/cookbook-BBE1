class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :video_link, url: { allow_blank: true }
end
