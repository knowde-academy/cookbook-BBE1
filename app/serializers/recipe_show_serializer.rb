class RecipeShowSerializer < RecipeSerializer
  UNKNOWN = 'unknown'.freeze
  attributes :video_link, :price, :cooking_time


  def video_link
    return UNKNOWN unless object.video_link

    object.video_link
  end


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
