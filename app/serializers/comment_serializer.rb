class CommentSerializer < ActiveModel::Serializer
  ANNONYMOUS = 'annonymous'
  
  attributes :id, :author, :body, :created_at

  def author
    return ANNONYMOUS if object.author.blank?

    object.author
  end
end
