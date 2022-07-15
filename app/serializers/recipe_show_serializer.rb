class RecipeShowSerializer < RecipeSerializer
  attributes :price

  def price
    return UNKNOWN unless object.price

    object.price
  end
end
