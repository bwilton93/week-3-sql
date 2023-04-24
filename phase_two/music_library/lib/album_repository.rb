class AlbumRepository
  def all
    sql = 'SELECT * FROM albums;'
    result = DatabaseConnection.exec_params(sql, [])

    result.each do |record|
      p record
    end
  end
end