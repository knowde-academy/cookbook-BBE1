class RecipeShowSerializer < RecipeSerializer
  UNKNOWN = "unknown".freeze
  attributes :price

  def price
    return UNKNOWN unless object.price

    object.price
  end
end
