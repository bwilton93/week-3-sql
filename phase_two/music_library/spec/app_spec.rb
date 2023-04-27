require_relative '../app'

RSpec.describe Application do
  it "app.rb outputs all albums sorted by ID" do
    album = double :album, id: 1, title: "Album 1"
    album2 = double :album, id: 2, title: "Album 2"
    albums = double :albums, all: [album, album2]
    artists = double :artists
    
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:puts).with("What would you like to do?")
    expect(io).to receive(:puts).with(" 1 - List all albums")
    expect(io).to receive(:puts).with(" 2 - List all artists")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:print).with("Enter your choice: ")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:puts).with(" * 1 - Album 1")
    expect(io).to receive(:puts).with(" * 2 - Album 2")
    
    app = Application.new('music_library_test', io, albums, artists)
    app.run
  end
  
  it "app.rb outputs all artists sorted by ID" do
    artist = double :artist, id: 1, name: "Artist 1"
    artist2 = double :artist, id: 2, name: "Artist 2"
    artists = double :artists, all: [artist, artist2]
    albums = double :albums
    
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:puts).with("What would you like to do?")
    expect(io).to receive(:puts).with(" 1 - List all albums")
    expect(io).to receive(:puts).with(" 2 - List all artists")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:print).with("Enter your choice: ")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("")
    expect(io).to receive(:puts).with(" * 1 - Artist 1")
    expect(io).to receive(:puts).with(" * 2 - Artist 2")
      
    app = Application.new('music_library_test', io, albums, artists)
    app.run  
  end
end
