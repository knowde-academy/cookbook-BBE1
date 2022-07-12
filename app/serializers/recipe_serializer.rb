class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :price
  
  def price
    return "unknown" unless object.price
    
    object.price
  end
end
