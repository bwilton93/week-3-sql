require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect('music_library_test')

artist_repository = ArtistRepository.new
album_repository = AlbumRepository.new

album_repository.all.each do |album|
  artist_name = artist_repository.find_by_id(album.artist_id)
  artist_name = artist_name.name
  p "#{album.id}: #{album.title} - #{artist_name}, #{album.release_year}"
end
