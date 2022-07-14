class CommentSerializer <ActiveModel::Serializer
  attributes :id, :author, :body, :created_at
  
  ANNONYMOUS = "annonymous"
  
def author
  return ANNONYMOUS if object.author.blank?
  
  object.author
end 
end