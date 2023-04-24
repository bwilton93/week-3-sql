require 'artist_repository'

def reset_artists_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end
  
describe ArtistRepository do
  before(:each) do 
    reset_artists_table
  end

  it "fetches all artists" do
    repo = ArtistRepository.new

    artists = repo.all
    expect(artists.length).to eq 2

    expect(artists.first.id).to eq "1"
    expect(artists.first.name).to eq "Artist 1"
    expect(artists.first.genre).to eq "Genre"
  end

  it "finds an artist when given an id" do
    repo = ArtistRepository.new

    artist = repo.find_by_id(1)
    expect(artist.name).to eq "Artist 1"
  end
end
