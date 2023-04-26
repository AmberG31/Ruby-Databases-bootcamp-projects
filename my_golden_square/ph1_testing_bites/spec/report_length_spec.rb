require 'report_length'

RSpec.describe "require_length method" do
  it "returns password length" do
    pass = report_length("hiya") 
    expect(pass).to eq "this string was 4 characters long"
  end
end
