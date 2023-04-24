require_relative './album'

class AlbumRepository
  def all
    albums = [] 

    sql = 'SELECT * FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      album = Album.new

      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      albums << album
    end

    return albums
  end

  def find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    result = DatabaseConnection.exec_params(sql, [])
    
    album = Album.new
    
    album.id = result.first["id"]
    album.title = result.first["title"]
    album.release_year = result.first["release_year"]
    album.artist_id = result.first["artist_id"]
    
    return album
  end
  
  def find_by_name(name)
    sql = "SELECT * FROM albums WHERE title = '#{name}';"
    result = DatabaseConnection.exec_params(sql, [])

    album = Album.new

    album.id = result.first["id"]
    album.title = result.first["title"]
    album.release_year = result.first["release_year"]
    album.artist_id = result.first["artist_id"]

    return album
  end

  def find_by_release_year(year)
    sql = "SELECT * FROM albums WHERE release_year = #{year};"
    result = DatabaseConnection.exec_params(sql, [])

    album = Album.new

    album.id = result.first["id"]
    album.title = result.first["title"]
    album.release_year = result.first["release_year"]
    album.artist_id = result.first["artist_id"]

    return album
  end

  def create(title, release_year, artist_id = 0)
    sql = "INSERT INTO albums (title, release_year, artist_id) VALUES ('#{title}', #{release_year}, #{artist_id});"

    DatabaseConnection.exec_params(sql, [])
  end

  def update_release_year(album, year)
    sql = "UPDATE albums SET release_year = #{year} WHERE title = '#{album}';"
    DatabaseConnection.exec_params(sql, [])
  end

  def delete(album_id)
    sql = "DELETE FROM albums WHERE id = #{album_id};"
    DatabaseConnection.exec_params(sql, [])
  end
end
