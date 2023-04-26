require 'fizzbuzz'

describe "fizzbuzz" do

  it "returns a number when passed 1 a non fizzbuzz number" do
    expect(fizzbuzz(1)).to eq 1
    expect(fizzbuzz(17)).to eq 17
    expect(fizzbuzz(22)).to eq 22
    expect(fizzbuzz(28)).to eq 28
    expect(fizzbuzz(47)).to eq 47
    expect(fizzbuzz(98)).to eq 98
  end

  it "returns 'fizz' when passed a number divisible by only 3" do
    expect(fizzbuzz(3)).to eq "fizz"
    expect(fizzbuzz(6)).to eq "fizz"
    expect(fizzbuzz(9)).to eq "fizz"
    expect(fizzbuzz(12)).to eq "fizz"
    expect(fizzbuzz(18)).to eq "fizz"
    expect(fizzbuzz(63)).to eq "fizz"
    expect(fizzbuzz(99)).to eq "fizz"
  end

  it "returns 'buzz' when passed numbers divsible by 5" do
    expect(fizzbuzz(5)).to eq "buzz"
    expect(fizzbuzz(10)).to eq "buzz"
    expect(fizzbuzz(20)).to eq "buzz"
    expect(fizzbuzz(100)).to eq "buzz"
  end

  it "returns 'fizzbuzz' when passed a number divisible by 15" do
    expect(fizzbuzz(15)).to eq "fizzbuzz"
    expect(fizzbuzz(45)).to eq "fizzbuzz"
    expect(fizzbuzz(30)).to eq "fizzbuzz"
    expect(fizzbuzz(90)).to eq "fizzbuzz"
  end
end

