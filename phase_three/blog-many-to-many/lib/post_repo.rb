require_relative './post'

class PostRepo
  def find_by_tag(name)
    posts = []

    sql = 'SELECT posts.id, posts.title
            FROM posts
            JOIN posts_tags ON posts_tags.post_id = posts.id
            JOIN tags ON posts_tags.tag_id = tags.id
            WHERE tags.name = $1;'
    
    results = DatabaseConnection.exec_params(sql, [name])

    results.each do |result|
      post = Post.new

      post.id = result['id']
      post.title = result['title']

      posts << post
    end

    return posts
  end
end