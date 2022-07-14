class CommentSerializer < ActiveModel::Serializer
  attributes :id, :author, :body, :created_at

  def author
    return 'anonymous' unless object.author

    object.author
  end
end
