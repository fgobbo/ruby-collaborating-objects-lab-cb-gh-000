class Artist
  attr_accessor :name, :songs
  @@all = []
  @@song_count = 0

  def initialize(name)
    @name = name
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
    @@all << self
  end

  def self.find_or_create_by_name(name)
    artist = self.find(name)
    artist ||= self.create(name)
    artist
  end

  def self.find(name)
    self.all.find { |artist| artist.name == name }
  end

  def self.create(name)
    self.new(name).tap { |artist| artist.save }
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end
end
