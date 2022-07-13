class CommentSerializer <ActiveModel::Serializer
  attributes :id, :author, :body, :created_at
  
def author
  return 'annonymous' if object.author.blank?
  
  object.author
end 
end