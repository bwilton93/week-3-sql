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

  it "first test" do

  end
end