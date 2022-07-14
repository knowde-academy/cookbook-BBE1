class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content

  has_many :comments

  def comments
    object.comments.order(created_at: :desc)
  end
end
