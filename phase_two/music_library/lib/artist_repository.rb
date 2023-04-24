require_relative './artist'

class ArtistRepository
  def all
    artists = [] 

    sql = 'SELECT * FROM artists;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      artist = Artist.new

      artist.id = record['id']
      artist.name = record['name']
      artist.genre = record['genre']

      artists << artist
    end

    return artists
  end

  def find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = #{id}"
    result = DatabaseConnection.exec_params(sql, [])
    
    artist = Artist.new
    
    artist.id = result.first["id"]
    artist.name = result.first['name']
    artist.genre = result.first['genre']

    return artist
  end
end