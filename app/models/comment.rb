class Comment <AplicationRecord
   belongs to :recipe
   validates: :body, presence: true, length: { minimum: 10 }
   
  end 
  