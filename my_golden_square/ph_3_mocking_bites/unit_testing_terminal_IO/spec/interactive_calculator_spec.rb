require "interactive_calculator"
# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run

# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1

RSpec.describe InteractiveCalculator do
  it "subtracts two numbers" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("4").ordered
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("3").ordered
    expect(terminal).to receive(:puts).with("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("4 - 3 = 1").ordered

    interactive_calculator = InteractiveCalculator.new(terminal)
    interactive_calculator.run
  end

  it "fails if first nubmer is not a number" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("four").ordered

    interactive_calculator = InteractiveCalculator.new(terminal)
    expect{ interactive_calculator.run }.to raise_error "Please provide a valid number"
  end

  it "fails if second nubmer is not a number" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("4").ordered
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("something").ordered

    interactive_calculator = InteractiveCalculator.new(terminal)
    expect{ interactive_calculator.run }.to raise_error "Please provide a valid number"
  end
end
