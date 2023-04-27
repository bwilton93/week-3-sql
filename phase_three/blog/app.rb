require_relative './lib/posts_repo'
require_relative './lib/database_connection'

DatabaseConnection.connect('blogs_database')

post_repo = PostsRepo.new
post = post_repo.find_with_comments(1)
    
