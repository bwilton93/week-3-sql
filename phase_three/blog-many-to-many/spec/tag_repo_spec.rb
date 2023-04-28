require 'tag_repo'

def reset_tables
  seeds_sql = File.read('spec/seeds.sql')
  connection = PG.connect( { host: '127.0.0.1', dbname: 'blogs_posts_tags' })
  connection.exec(seeds_sql)
end

describe TagRepo do
  before(:each) do
    reset_tables
  end

  it 'returns all tags with relative posts' do
    repo = TagRepo.new
    tags = repo.find_by_post(1)
    expect(tags.length).to eq 1
    expect(tags.first.name).to eq 'coding'
  end
end
