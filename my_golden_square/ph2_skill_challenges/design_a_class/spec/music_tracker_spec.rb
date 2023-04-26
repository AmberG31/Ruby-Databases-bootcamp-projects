require "music_tracker"

describe MusicTracker do
  context "list method" do 
    it "returns and empty string if there is no song" do
      song1 = MusicTracker.new
      song1.add("")
      expect(song1.list).to eq ""
    end
    
    it "returns a song" do
      song1 = MusicTracker.new
      song1.add("Weekend")
      expect(song1.list).to eq "Weekend"
    end
    
    it "returns a song" do
      song1 = MusicTracker.new
      song1.add("Weekend")
      song1.add("I fly")
      song1.add("Dance")
      expect(song1.list).to eq "Weekend, I fly, Dance"
    end
  end
end