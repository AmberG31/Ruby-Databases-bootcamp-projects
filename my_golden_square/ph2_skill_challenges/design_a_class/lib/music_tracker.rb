class MusicTracker
  def initialize
    @songs = []
  end
  
  def add(song)
    @songs << song
  end
  
  def list
    return @songs.join(", ")
  end
  
end