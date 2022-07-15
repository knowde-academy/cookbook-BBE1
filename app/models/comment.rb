class Comment < ApplicationRecord
  belongs_to :recipe

  validates :body, presence: true, length: { minimum: 10 }
  validates :author, allow_blank: true, length: { minimum: 3 }
end
