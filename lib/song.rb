require 'pry'
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    # file name format: "<artist> - <song_name> - <genre>.<extension>"
    artist, name = file_name.split(' - ')
    song = Song.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.artist.add_song(song)
    song
  end
end
