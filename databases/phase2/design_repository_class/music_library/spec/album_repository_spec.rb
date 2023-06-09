require "album_repository"

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({host:'127.0.0.1', dbname: 'music_library_test'})
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end
   
  it "returns two albums" do
    repo = AlbumRepository.new
    album = repo.all
    expect(album.length).to eq 2
    expect(album.first.title).to eq 'ABBA'
    expect(album.first.release_year).to eq "1990"
    expect(album.first.artist_id).to eq "1"
  end

  it "finds an album matching the id" do
    repo = AlbumRepository.new
    album = repo.find(1)
    expect(album.title).to eq 'ABBA'
    expect(album.release_year).to eq "1990"
    expect(album.artist_id).to eq "1"
  end

  it "finds an album matching the id" do
    repo = AlbumRepository.new
    album = repo.find(2)
    expect(album.title).to eq 'Bob Jon'
    expect(album.release_year).to eq "1997"
    expect(album.artist_id).to eq "2"
  end

end
