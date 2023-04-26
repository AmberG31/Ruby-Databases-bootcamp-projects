require "reading_time"

describe "reading_time method" do
  context "when given an ampty string" do
    it "returns zero" do 
      result = calculate_reading_time("")
      expect(result).to eq 0
    end
  end
  
  context "when given one word" do
    it "returns one" do 
      result = calculate_reading_time("one")
      expect(result).to eq 1
    end
  end
  
  context "when given one-hundred words" do
    it "returns one-hundred" do 
      result = calculate_reading_time("one " * 100)
      expect(result).to eq 1
    end
  end
  
  context "when given four-hundred words" do
    it "returns four-hundred" do 
      result = calculate_reading_time("one " * 400)
      expect(result).to eq 2
    end
  end
  
end