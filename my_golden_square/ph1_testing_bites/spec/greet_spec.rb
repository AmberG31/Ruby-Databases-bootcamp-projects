require "greet"

RSpec.describe "greet method" do
  it "greets the user" do
    test_one = greet("Amber")
    expect(test_one).to eq "hello Amber"
  end
end
