require "counter"

RSpec.describe Counter do 
  it "adds a number to a count" do 
    input = Counter.new()
    input.add(5)
    answer = input.report
    expect(answer).to eq "Counted to 5 so far."
  end
end