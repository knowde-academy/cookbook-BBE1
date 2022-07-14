class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :cooking_time
  
  def cooking_time
    return "unknow" unless object.cooking_time
    
    object.cooking_time
  end
end
