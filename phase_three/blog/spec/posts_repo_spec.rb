require 'posts_repo'

def reset_tables
  seeds_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blogs_database' })
  connection.exec(seeds_sql)
end

RSpec.describe PostsRepo do
  before(:each) do
    reset_tables
  end

  it "finds post 1 with related comments" do
    repo = PostsRepo.new
    post = repo.find_with_comments(1)

    expect(post.title).to eq "Post 1"
    expect(post.comments.length).to eq 2
  end
end
