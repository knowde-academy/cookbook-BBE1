class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :cooking_time
  UNKNOWN = 'unknown'
  
  def cooking_time
    return UNKNOWN unless object.cooking_time

    object.cooking_time
  end
end
