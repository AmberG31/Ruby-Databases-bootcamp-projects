require "password_checker"

RSpec.describe PasswordChecker do
  it "checking if password has enough characters" do
    pass1 = PasswordChecker.new
    expect(pass1.check("12345678")).to eq true
  end
  it "checking if password doesnt have enough characters" do
    pass1 = PasswordChecker.new
    expect{ pass1.check("1234") }.to raise_error "Invalid password, must be 8+ characters."
  end
end