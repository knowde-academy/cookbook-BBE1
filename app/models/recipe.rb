class Recipe < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy

  validates :price, numericality: { greater_than: 0 }, allow_nil: true
  validates :name, presence: true
  validates :video_link, url: { allow_nil: true }
  validates :cooking_time, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :level, numericality: { only_integer: true, greater_than: 0, less_than: 6 }, allow_nil: true
end
