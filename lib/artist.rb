class Artist
  attr_accessor :name, :songs
  @@all = []
  @@song_count = 0

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
    @@song_count += 1
  end

  def self.all
    @@all
  end

  def save

  end

  def self.find_or_create_by_name(name)
    artist = @@all.find { |artist| artist.name == name }
    artist ||= Artist.new(name)
    artist
  end

  def print_songs
    @songs.each { |song| puts song.name}
  end
end
