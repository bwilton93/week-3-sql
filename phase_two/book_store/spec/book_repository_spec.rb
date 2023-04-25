require 'book_repository'

def reset_books_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_books_table
  end

  it "fetches full list of books" do
    repo = BookRepository.new

    books = repo.all
    expect(books.length).to eq 5
    expect(books.last.id).to eq "5"
    expect(books.last.title).to eq "The Age of Innocence"
    expect(books.last.author_name).to eq "Edith Wharton"
  end
end