require "cart"

RSpec.describe "Cart methods" do
  context "when one item is added" do
    it "#view_cart returns dish and quantity" do
      order = Cart.new
      order.add("chicken strips", 1)
      expect(order.view_cart).to eq "chicken strips x1"
    end
  end
  
  context "when two items are added" do
    it "#view_cart returns both dishes and quantity" do
      order = Cart.new
      order.add("chicken strips", 1)
      order.add("ribs", 1)
      expect(order.view_cart).to eq "chicken strips x1, ribs x1"
    end
  end
  
  context "when one item is added 3 times" do
    it "#view_cart returns one item and quantity" do
      order = Cart.new
      order.add("chicken strips", 3)
      expect(order.view_cart).to eq "chicken strips x3"
    end
  end
  
  context "when two items are added and one is removed" do
    it "#view_cart returns one item and quantity" do
      order = Cart.new
      order.add("chicken strips", 1)
      order.add("ribs", 1)
      order.remove("chicken strips", 1)
      expect(order.view_cart).to eq "ribs x1"
    end
  end
  
  context "when one item is added 3 times and removed once" do
    it "#view_cart returns one item and quantity" do
      order = Cart.new
      order.add("chicken strips", 3)
      order.remove("chicken strips", 1)
      expect(order.view_cart).to eq "chicken strips x2"
    end
  end

  context "when the cart is empty" do
    it "#view_cart returns an error messageg" do
      order = Cart.new
      order.add("chicken strips", 2)
      order.remove("chicken strips", 2)
      expect{ order.view_cart }.to raise_error "Your cart is empty"
    end
  end
  
  context "when the there is one item" do
    it "#print_receipt returns the cart and grand total" do
      order = Cart.new
      order.add("chicken strips", 1)
      expect(order.print_receipt).to eq "chicken strips x1. Grand total: £5.00"
    end
  end
  
  # the example above - need to create / pull the price from somewhere
end