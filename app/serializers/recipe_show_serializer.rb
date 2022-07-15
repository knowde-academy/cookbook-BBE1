class RecipeShowSerializer < RecipeSerializer
  UNKNOWN = 'unknown'.freeze

  attributes :price, :cooking_time

  has_many :comments

  def comments
    object.comments.order(created_at: :desc)
  end

  def price
    return UNKNOWN unless object.price

    object.price
  end

  def cooking_time
    return UNKNOWN unless object.cooking_time

    object.cooking_time
  end
end
