require_relative 'lib/database_connection'
require_relative "lib/album_repository"
require_relative "lib/artist_repository"


DatabaseConnection.connect('music_library')

album_repository = AlbumRepository.new
artist_repository = ArtistRepository.new

# artist_repository.all.each do |artist|
#   p artist
# end

# album_repository.all.each do |record|
#   p "#{record.id}. #{record.title} - #{record.release_year} - #{record.artist_id}"
# end

# get the album with ID 3
album = album_repository.find(3)

puts album.id 
puts album.title
puts album.release_year
puts album.artist_id
