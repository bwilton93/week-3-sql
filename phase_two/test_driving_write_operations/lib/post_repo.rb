class PostRepo
  def all
    posts = []

    sql = "SELECT * FROM posts;"
    records = DatabaseConnection.exec_params(sql, [])

    records.each do |record|
      post = Post.new

      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      post.number_of_views = record['number_of_views']
      post.user_account_id = record['user_account_id']
      
      posts << post
    end
    
    return posts
  end
  
  def find(id)
    sql = "SELECT * FROM posts WHERE id = $1;"
    
    record = DatabaseConnection.exec_params(sql, [id]).first
    
    post = Post.new
    post.id = record['id']
    post.title = record['title']
    post.content = record['content']
    post.number_of_views = record['number_of_views']
    post.user_account_id = record['user_account_id']

    return post
  end

  def create
  end

  def delete
  end

  def update
  end
end