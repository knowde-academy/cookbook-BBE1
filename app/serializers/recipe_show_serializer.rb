class RecipeShowSerializer < RecipeSerializer
  attributes :video_link

  def video_link
    return UNKNOWN unless object.video_link

    object.video_link
  end
end
