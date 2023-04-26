require "present"

RSpec.describe Present do
  it "expect to wrap and unwrap the value" do
    present = Present.new
    present.wrap("Spoon")
    expect(present.unwrap).to eq "Spoon"
  end 
  
  it "it fails if nothing is wrapped yet" do
    present = Present.new
    expect { present.unwrap }.to raise_error "No contents have been wrapped."
  end
  
  it "if present was already wrapped, can't wrap it again" do
    present = Present.new
    present.wrap("Spoon")
    expect { present.wrap("Spoon") }.to raise_error "A contents has already been wrapped."
  end
  
end
