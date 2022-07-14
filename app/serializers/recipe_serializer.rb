class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :cooking_time
  
  def cooking_time
    return "unknown" unless object.cooking_time
    
    object.cooking_time
  end
end
