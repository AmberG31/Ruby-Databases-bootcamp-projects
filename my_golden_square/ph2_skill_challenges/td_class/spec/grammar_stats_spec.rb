require "grammar_stats"

describe GrammarStats do
  # text is a string
  # Returns true or false depending on whether the text begins with a capital
  # letter and ends with a sentence-ending punctuation mark.

  describe "check method" do
    it "rerutns error if the string is empty" do
      new_text = GrammarStats.new
      expect{ new_text.check("") }.to raise_error "Error: stirng is empty."
    end
    
    it "returns true if the first letter is capital" do
      new_text = GrammarStats.new
      result = new_text.check("Hello, how are you?")
      expect(result).to eq true
    end
    
    it "returns false if the first letter is not capital" do
      new_text = GrammarStats.new
      result = new_text.check("hello, how are you?")
      expect(result).to eq false
    end
    
    it "returns true if sentence ends with correct punctuation" do
      new_text = GrammarStats.new
      result = new_text.check("Hello, how are you?")
      expect(result).to eq true
    end
  end
  
  # Returns as an integer the percentage of texts checked so far that passed
  # the check defined in the `check` method. The number 55 represents 55%.
  
  describe "percentage_good method" do
    
    it "returns 0 when passed one incorrect text" do
      new_text = GrammarStats.new
      new_text.check("hello")
      expect(new_text.percentage_good).to eq "0% has passed so far"
    end
    
    it "returns 50 when passed one correct and one incorrect text" do
      new_text = GrammarStats.new
      new_text.check("hello")
      new_text.check("Hello.")
      expect(new_text.percentage_good).to eq "50% has passed so far"
      new_text.check("Good sentence?")
      new_text.check("This is correct example.")
      expect(new_text.percentage_good).to eq "75% has passed so far"
    end 
    
  end

end