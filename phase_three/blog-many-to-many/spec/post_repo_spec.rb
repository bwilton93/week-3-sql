require 'post_repo'

def reset_tables
  seeds_sql = File.read('spec/seeds.sql')
  connection = PG.connect( { host: '127.0.0.1', dbname: 'blogs_posts_tags' })
  connection.exec(seeds_sql)
end

RSpec.describe PostRepo do
  before(:each) do
    reset_tables
  end

  it "returns all posts when passed a tag name" do
    repo = PostRepo.new
    
    name = 'coding'
    posts = repo.find_by_tag(name)

    expect(posts.length).to eq 4
    expect(posts.first.title).to eq 'How to use Git'
    expect(posts.last.title).to eq 'SQL basics'
  end
end