require "diary_entry"

describe DiaryEntry do
  context "methods title and contents" do
    it "returns the title and contents as a string" do
      diary_entry = DiaryEntry.new("Hello", "Some text")
      expect(diary_entry.title).to eq "Hello"
      expect(diary_entry.contents).to eq "Some text"
    end 
  end
  
  context "method count_words" do
    it "Returns the number of words in the contents as an integer" do
      diary_entry = DiaryEntry.new("Hello", "Some text")
      expect(diary_entry.count_words).to eq 2
    end
  end
  
  context "method reading_time" do 
    it "returns the expected reading time in minutes" do
      diary_entry = DiaryEntry.new("Hello", "Some text " * 10)
      expect(diary_entry.reading_time(1)).to eq 20
    end
    
    # wpm is an integer representing the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    
    it "reading_time speed must be above 0" do
      diary_entry = DiaryEntry.new("Hello", "Some text " * 10)
      expect{ diary_entry.reading_time(0) }.to raise_error "Reading speed must be above 0"
    end
  end
    # `wpm` is an integer representing the number
    # of words the user can read per minute
    # `minutes` is an integer representing the
    # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  
  context "test for the reading_chunk method" do
    it "returns the content based on wpm and available minutes" do
      diary_entry = DiaryEntry.new("Hello", "Lorem Ipsum is simply dummy text of the printing and typesetting industry")
      expect(diary_entry.reading_chunk(200,1)).to eq "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
    end 
    
    it "returns the chunk of text based on wpm and available minutes" do
      diary_entry = DiaryEntry.new("Hello", "Lorem Ipsum is simply dummy text of the printing and typesetting industry")
      expect(diary_entry.reading_chunk(2,1)).to eq "Lorem Ipsum"
    end 
    
    it "returns the next chunk of text based on wpm and available minutes" do
      diary_entry = DiaryEntry.new("Hello", "Lorem Ipsum is simply dummy text of the printing and typesetting industry")
      diary_entry.reading_chunk(2,1)
      chunk = diary_entry.reading_chunk(2,1)
      expect(chunk).to eq "is simply"
    end 
    
    it "restarts after reading the whole chunk" do
      diary_entry = DiaryEntry.new("Hello", "Lorem Ipsum is simply dummy text of the printing and typesetting industry")
      diary_entry.reading_chunk(2,1)
      diary_entry.reading_chunk(2,1)
      expect(diary_entry.reading_chunk(2,1)).to eq "is simply"
    end 
  end
  
end