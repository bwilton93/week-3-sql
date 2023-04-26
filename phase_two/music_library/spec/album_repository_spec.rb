require 'album_repository'
require 'album'

def reset_albums_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end
  
describe AlbumRepository do
  before(:each) do 
    reset_albums_table
  end

  it "fetches all albums" do
    repo = AlbumRepository.new

    albums = repo.all
    expect(albums.length).to eq 2
    
    expect(albums[0].id).to eq "1"
    expect(albums[0].title).to eq "Album 1"
    expect(albums[0].release_year).to eq "2022"
    expect(albums[0].artist_id).to eq "1"
  
    expect(albums[1].id).to eq "2"
    expect(albums[1].title).to eq "Album 2"
    expect(albums[1].release_year).to eq "2023"
    expect(albums[1].artist_id).to eq "2"
  end

  it "fetches album when given an album ID" do
    repo = AlbumRepository.new

    album = repo.find_by_id(1)
    expect(album.title).to eq "Album 1"
  end

  it "fetches album when passed album title" do
    repo = AlbumRepository.new

    album = repo.find_by_name("Album 1")
    expect(album.id).to eq "1"
  end
  
  it "fetches album when passed release year" do
    repo = AlbumRepository.new
  
    album = repo.find_by_release_year(2022)
    expect(album.id).to eq "1"
  end

  context "when creating a new album" do
    repo = AlbumRepository.new
    
    album = Album.new
    album.title = "Album 3"
    album.release_year = 2023
    album.artist_id = 2
    
    it "can create a new album" do
      repo.create(album)
      albums = repo.all
      expect(albums.length).to eq 3

      expect(albums[-1].id).to eq "3"
      expect(albums[-1].title).to eq "Album 3"
      expect(albums[-1].release_year).to eq "2023"
    end
    
    it "can update the release year for the album" do
      repo.create(album)
      repo.update_release_year(album.title, 2022)
      albums = repo.all
      expect(albums[-1].release_year). to eq "2022"
    end
  end

  it "can delete an album from the database" do
    repo = AlbumRepository.new
    album_id = 1
    repo.delete(album_id)

    albums = repo.all
    expect(albums.length).to eq 1
  end
end
