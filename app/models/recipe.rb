class Recipe < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :price, numericality: { greater_than: 0 }
  validates :name, presence: true
  validates :video_link, url: { allow_nil: true }
  validates :cooking_time, numericality: { only_integer: true, greater_than: 0 }
  validates :level, integer: { :in => 1..5 }
end
