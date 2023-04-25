require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

DatabaseConnection.connect('book_store_test')

book_repo = BookRepository.new

books = book_repo.all

books.each do |book|
  puts "#{book.id} - #{book.title} - #{book.author_name}"
end

