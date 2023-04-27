class PostsRepo
  def find_with_comments(id)
    sql = 'SELECT posts.id,
                posts.title,
                posts.content,
                comments.id AS comment_id,
                comments.content AS comment_content,
                comments.author_name 
            FROM posts
              JOIN comments
              ON comments.post_id = posts.id
            WHERE posts.id = $1;'
  end
end