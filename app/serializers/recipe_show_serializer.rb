class RecipeShowSerializer < RecipeSerializer
  UNKNOWN = 'unknown'.freeze

  attributes :price

  has_many :comments

  def comments
    object.comments.order(created_at: :desc)
  end

  def price
    return UNKNOWN unless object.price

    object.price
  end
end
