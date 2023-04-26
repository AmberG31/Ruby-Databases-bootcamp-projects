require "diary_entry"

describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("title one", "contents one")
    expect(diary_entry.title).to eq "title one"
    expect(diary_entry.contents).to eq "contents one"
  end
  
  context "method count_words" do
    it "returns 0 if the contents is empty" do
     diary_entry = DiaryEntry.new("title one", "")
     expect(diary_entry.count_words).to eq 0
    end
    
    it "returns 1 if the contents is one word" do
     diary_entry = DiaryEntry.new("title one", "word")
     expect(diary_entry.count_words).to eq 1
    end
    
    it "returns 4 if the contents is four words" do
     diary_entry = DiaryEntry.new("title one", "this is four words")
     expect(diary_entry.count_words).to eq 4
    end
  end
  
    # wpm is an integer representing
    # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  context "calculate entry reading time" do
    it "fails if wpm is a positive integer" do
      diary_entry = DiaryEntry.new("title one", "this is four words")
      expect { diary_entry.reading_time(0) }.to raise_error "Error: wpm is not valid entry"
    end
    
    it "returns one minute if passed two words" do 
      diary_entry = DiaryEntry.new("title one", "this is")
      expect(diary_entry.reading_time(10)).to eq 1
    end
    
    it "returns 0 minutes if the string is empty" do 
      diary_entry = DiaryEntry.new("title one", "")
      expect(diary_entry.reading_time(10)).to eq 0
    end
  end
  
  # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    
  context "return relevant reading chunks" do 
    it "returns the first chunk" do 
      diary_entry = DiaryEntry.new("title one", "Today is Monday, the first day of the week. Have a tea.")
      chunk = diary_entry.reading_chunk(5, 1)
      expect(chunk).to eq "Today is Monday, the first"
    end
    
    it "returns the second chunk" do 
      diary_entry = DiaryEntry.new("title one", "Today is Monday, the first day of the week. Have a tea.")
      diary_entry.reading_chunk(5, 1)
      chunk = diary_entry.reading_chunk(5, 1)
      expect(chunk).to eq "day of the week. Have"
    end
    
    it "returns the final chunk" do 
      diary_entry = DiaryEntry.new("title one", "Today is Monday, the first day of the week. Have a tea.")
      diary_entry.reading_chunk(5, 1)
      diary_entry.reading_chunk(5, 1)
      chunk = diary_entry.reading_chunk(5, 1)
      expect(chunk).to eq "a tea."
    end
    
    it "starts from the beginning of the text" do 
      diary_entry = DiaryEntry.new("title one", "Today is Monday, the first day of the week. Have a tea.")
      diary_entry.reading_chunk(5, 1)
      diary_entry.reading_chunk(5, 1)
      diary_entry.reading_chunk(5, 1)
      chunk = diary_entry.reading_chunk(5, 1)
      expect(chunk).to eq "Today is Monday, the first"
    end
  end  
end