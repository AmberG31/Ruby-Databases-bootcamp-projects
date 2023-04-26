require 'check_codeword'

RSpec.describe "check_codeword method" do
  it "checks a password" do
    test_one = check_codeword("horse")
    expect(test_one).to eq "Correct! Come in."
    test_two = check_codeword("anna")
    expect(test_two).to eq "WRONG!"
  end
end
