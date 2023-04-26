require "diary_entry"

RSpec.describe "DiaryEntry construct" do
  context "#title & # content: when a new entry is added" do
    it "return title and content" do
      entry_1 = DiaryEntry.new("my_title","my_content")
      expect(entry_1.title).to eq "my_title"
      expect(entry_1.content).to eq "my_content"
    end
  end
  
  context "#count_words when there are 3 words" do
    it "return 3" do
      entry_1 = DiaryEntry.new("my_title","my_content is this")
      expect(entry_1.count_words).to eq 3
    end
  end
  
  context "#show_numbers when there is one number in the entry" do
    it "returns the phone number" do
      entry_1 = DiaryEntry.new("my_title","my number is 07889966777")
      expect(entry_1.show_numbers).to eq ["07889966777"]
    end
  end
  
  context "#show_numbers when there are two numbers in the entry" do
    it "returns the list of phone number" do
      entry_1 = DiaryEntry.new("my_title","my number is 07889966777 and Jon's is 07889966888")
      expect(entry_1.show_numbers).to eq ["07889966777", "07889966888"]
    end
  end
end