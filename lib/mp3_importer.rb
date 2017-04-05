class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    import
  end

  def import
    @files = Dir["#{@path}/*.mp3"].map { |file| File.basename(file) }
    @files.map { |file| Song.new_by_filename(file) }
  end

end
