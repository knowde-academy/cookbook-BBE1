class RecipeShowSerializer < RecipeSerializer
  attributes :price
  
  def price
    return "unknown" unless object.price
    
    object.price
    
  end
end