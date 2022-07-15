class RecipeShowSerializer < RecipeSerializer
  UNKNOWN = 'unknown'.freeze
  attributes :cooking_time

  def cooking_time
    return UNKNOWN unless object.cooking_time

    object.cooking_time
  end
end
