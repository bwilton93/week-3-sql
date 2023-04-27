require_relative './lib/album_repository'
require_relative './lib/artist_repository'
require_relative './lib/database_connection'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    welcome_message
    new_line
    choices
    new_line
    input = selection
    new_line
    case input
    when "1"
      output_albums
    when "2"
      output_artists
    else
      invalid_selection
    end
  end
    
  def new_line
    @io.puts("")
  end

  def welcome_message
    @io.puts("Welcome to the music library manager!")
  end

  def choices
    @io.puts("What would you like to do?")
    @io.puts(" 1 - List all albums")
    @io.puts(" 2 - List all artists")
  end

  def selection
    @io.print("Enter your choice: ")
    return @io.gets.chomp
  end

  def output_albums
    albums = @album_repository.all
    albums.sort_by! { |album| album.id }

    albums.each do |album|
      @io.puts(" * #{album.id} - #{album.title}")
    end
  end

  def output_artists
    artists = @artist_repository.all
    artists.sort_by! { |artist| artist.id }

    artists.each do |artist|
      @io.puts(" * #{artist.id} - #{artist.name}")
    end
  end

  def invalid_selection
    @io.puts("Selection invalid")
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end