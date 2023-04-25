require_relative './book'

class BookRepository
  def all
    books = []

    sql = "SELECT * FROM books;"
    search_results = DatabaseConnection.exec_params(sql, [])

    search_results.each do |result|
      book = Book.new

      book.id = result['id']
      book.title = result['title']
      book.author_name = result['author_name']

      books << book
    end

    return books
  end
end