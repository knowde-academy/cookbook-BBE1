class RecipeShowSerializer < RecipeSerializer
  UNKNOWN = "unknown".freeze
  attributes :price, :cooking_time

  def price
    return UNKNOWN unless object.price

    object.price
  end

  def cooking_time
    return UNKNOWN unless object.cooking_time

    object.cooking_time
  end
end
