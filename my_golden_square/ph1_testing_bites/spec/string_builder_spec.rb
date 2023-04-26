require 'string_builder.rb'

RSpec.describe StringBuilder do
  it "returns the length of a string" do
    string = StringBuilder.new()
    string.add("hello")

    length = string.size
    expect(length).to eq 5
 
  end
  
  it "returns the string" do
    string = StringBuilder.new()
    string.add("hello")

    text = string.output
    expect(text).to eq "hello"
  end
end
    
