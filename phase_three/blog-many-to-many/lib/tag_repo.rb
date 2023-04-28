require_relative './tag'

class TagRepo
  def find_by_post(id)
    tags = []

    sql = 'SELECT tags.id, tags.name
          FROM tags
          JOIN posts_tags ON posts_tags.tag_id = tags.id
          JOIN posts ON posts_tags.post_id = posts.id
          WHERE posts.id = $1;'
    
    results = DatabaseConnection.exec_params(sql, [id])
    
    results.each do |result|
      tag = Tag.new

      tag.id = result['id']
      tag.name = result['name']
      
      tags << tag
    end
    return tags
  end
end