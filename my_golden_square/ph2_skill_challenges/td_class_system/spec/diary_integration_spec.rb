require "diary"
require "diary_entry"

describe "diary_integration" do 
  it "lists outs all the entries" do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new("title_1", "contents_1")
    diary_entry2 = DiaryEntry.new("title_2", "contents_2")
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    expect(diary.all).to eq [diary_entry1, diary_entry2]
  end
  
  context "method count_words" do
    it "has a word count of 5" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title_1", "contents one")
      diary_entry2 = DiaryEntry.new("title_2", "contents two test")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.count_words).to eq 5
    end
  end
  
    # wpm is an integer representing
    # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    
  context "describe reading_time behaviour" do 
    it "calculates the reading time for all entries" do 
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title_1", "contents one")
      diary_entry2 = DiaryEntry.new("title_2", "contents two test")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.reading_time(2)).to eq 3
    end
    
    it "calculates the reading time for all entries" do 
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title_1", "contents one")
      diary_entry2 = DiaryEntry.new("title_2", "contents two test")
      diary_entry3 = DiaryEntry.new("title_3", "adding four more words")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      expect(diary.reading_time(2)).to eq 5
    end
  end
end

  # Returns an instance of diary entry representing the entry that is closest 
  # to, but not over, the length that the user could read in the minutes they
  # have available given their reading speed.
describe "best entry reading time" do
  context "only one entry available" do 
    it "returns available entry if it can be read in the given time" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title_1", "Today is Monday, the first day")
      diary.add(diary_entry1)
      expect(diary.find_best_entry_for_reading_time(2,3)).to eq diary_entry1
    end
  end
end