require "diary"

#A method called make_snippet that takes a string as an argument 
#and returns the first five words and then a '...' 
#if there are more than that.

RSpec.describe "method make_snippet" do
  context "given a string of less than 5 words" do
    it "when string is less than 5 word, returns the string" do
      result = make_snippet("Hello, my name is")
      expect(result).to eq "Hello, my name is"
    end
  end
  
  context "given a string of 5 words" do
    it "when string is more than 5 words, return 5 words and '...'" do
      result = make_snippet("Hello, my name is Amber.")
      expect(result).to eq "Hello, my name is Amber."
    end
  end
  
  context "given a string of more than 5 words" do
    it "when string is more than 5 words, return 5 words and '...'" do
      result = make_snippet("Hello, my name is Amber. What is yours?")
      expect(result).to eq "Hello, my name is Amber. ..."
    end
  end
  
end