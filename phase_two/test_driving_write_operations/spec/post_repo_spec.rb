require 'post_repo'
require 'post'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end
  
describe PostRepo do
  before(:each) do 
    reset_tables
  end

  describe "#all" do
    it "returns all records from the posts table" do
      repo = PostRepo.new
      posts = repo.all
      
      expect(posts.length).to eq 1
      expect(posts.first.id).to eq "1"
      expect(posts.first.title).to eq "Post 1"
      expect(posts.first.content).to eq "Some content"
      expect(posts.first.number_of_views).to eq "2"
      expect(posts.first.user_account_id).to eq "1"
    end
  end
  
  describe "#find" do
    it "returns a single post from the posts table" do
      repo = PostRepo.new
      
      post = repo.find(1)

      expect(post.id).to eq "1"
      expect(post.title).to eq "Post 1"
      expect(post.content).to eq "Some content"
      expect(post.number_of_views).to eq "2"
      expect(post.user_account_id).to eq "1"
    end
  end

  describe "#create" do
    it "creates a new post in the post table" do
      
    end
  end
end