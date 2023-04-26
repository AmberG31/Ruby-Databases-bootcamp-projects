require "count_words"

#A method called count_words that takes a string as an argument 
#and returns the number of words in that string.

RSpec.describe "method count_words" do
  it "returns a number of words" do
    result = count_words("Hi mate")
    expect(result).to eq 2
  end
  
end