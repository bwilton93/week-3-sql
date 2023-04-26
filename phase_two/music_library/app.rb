require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/album'
require_relative 'lib/artist_repository'

def print_all(album_repository, artist_repository)
  album_repository.all.each do |album|
    artist_name = artist_repository.find_by_id(album.artist_id)
    artist_name = artist_name.name
    puts "#{album.id}: #{album.title} - #{artist_name}, #{album.release_year}"
  end
end

DatabaseConnection.connect('music_library')

artist_repository = ArtistRepository.new
album_repository = AlbumRepository.new

puts "outputting all albums"
print_all(album_repository, artist_repository)

puts "\noutputting just the second entry on it's own:"
album = album_repository.find_by_id(2)
artist_name = artist_repository.find_by_id(album.artist_id).name
puts "#{album.id}: #{album.title} - #{artist_name}, #{album.release_year}"

puts "\ncreating a new album and then outputting all albums"
album_to_create = Album.new
album_to_create.title = "Album 3"
album_to_create.release_year = 2023
album_to_create.artist_id = 1

album_repository.create(album_to_create)
print_all(album_repository, artist_repository)