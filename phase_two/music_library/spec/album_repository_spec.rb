require 'album_repository'

def reset_albums_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end
  
describe AlbumRepository do
  # before(:each) do 
  #   reset_albums_table
  # end

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

  it "can create a new album" do
    repo = AlbumRepository.new

    title = "Album 3"
    release_year = 2023

    repo.create(title, release_year)
    
    albums = repo.all
    expect(albums.length).to eq 3
    expect(albums[-1].id).to eq "3"
    expect(albums[-1].title).to eq "Album 3"
    expect(albums[-1].release_year).to eq "2023"
    expect(albums[-1].artist_id).to eq "0"
  end
end

def create(title, release_year, artist_id)
# INSERT INTO albums
# (title, release_year, artist_id)
# VALUES(name, release_year, artist_id)
# returns nothing
end

def update_release_year(album, year)
# UPDATE albums SET release_year = year  WHERE id = album.id
# returns nothing
end

def delete(album)
# DELETE FROM albums WHERE id = album.id
# returns nothing
end