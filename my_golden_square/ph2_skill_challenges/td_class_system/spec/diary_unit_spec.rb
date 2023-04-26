require "diary"

describe Diary do
  context "method all" do
    it "returns an empty array if there are no entries" do
      entry_1 = Diary.new
      expect(entry_1.all).to eq []
    end
  end
  
  context "method count_words" do
    it "has a word count of 0" do
      entry_1 = Diary.new
      expect(entry_1.count_words).to eq 0
    end
  end
end