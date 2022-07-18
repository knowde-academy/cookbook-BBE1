class Comment < ApplicationRecord
  belongs_to :recipe

  validates :body, presence: true, length: { minimum: 10 }
  validates :author, allow_nil: true, length: { minimum: 3 }
end
