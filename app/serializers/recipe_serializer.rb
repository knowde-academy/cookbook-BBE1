class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content
  UNKNOWN = 'unknown'
end
