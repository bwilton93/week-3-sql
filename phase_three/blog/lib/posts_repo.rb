require_relative './post'
require_relative './comment'

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

    result = DatabaseConnection.exec_params(sql, [id])

    post = Post.new
    post.id = result.first['id']
    post.title = result.first['title']
    post.content = result.first['content']

    result.each do |record|
      comment = Comment.new

      comment.id = record['comment_id']
      comment.content = record['comment_content']
      comment.author_name = record['author_name']

      post.comments << comment
    end

    return post
  end
end