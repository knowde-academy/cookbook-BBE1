class RecipeSerializer < ActiveModel::Serializer
  UNKNOWN = "unknown".friz
  
  attributes :id, :name, :content
end
