require "gratitudes"

RSpec.describe Gratitudes do
  it "adds a gratitude" do
    grat1 = Gratitudes.new()
    grat1.add("sunshine")
    result = grat1.format
    expect(result).to eq "Be grateful for: sunshine"
  end
  it "adds a gratitude" do
    grat1 = Gratitudes.new()
    grat1.add("sunshine")
    grat1.add("water")
    result = grat1.format
    expect(result).to eq "Be grateful for: sunshine, water"
  end
end