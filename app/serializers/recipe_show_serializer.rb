class RecipeShowSerializer < RecipeSerializer
  UNKNOWN = 'unknown'.freeze
  attributes :video_link, :price

  def video_link
    return UNKNOWN unless object.video_link

    object.video_link
  end
  
  def price
    return UNKNOWN unless object.price

    object.price
  end
end
