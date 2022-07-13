class Comment < ApplicationRecord
  belongs_to :recipe
  validates :body, presence: true, length: { minimum: 10 }
end
