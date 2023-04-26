require "task_tracker"

describe "task_tracker method" do
  it "returns an error if the string is empty" do
    expect { task_tracker("") }.to raise_error "Error: empty string."
  end
  
  it "returns true if #TODO is in the text" do
    result = task_tracker("#TODO")
    expect(result).to eq true
  end
  
  it "returns false if #TODO is not the text" do
    result = task_tracker("Some text")
    expect(result).to eq false
  end

end