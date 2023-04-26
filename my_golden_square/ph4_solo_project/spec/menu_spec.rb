require "menu"

RSpec.describe "Menu methods" do
  context "when one dish is added" do
    it "#show_list returns dish and the price" do
      order = Menu.new
      order.add_dish("chicken strips", 5)
      expect(order.show_list).to eq "chicken strips £5"
    end
  end
  
  context "when two dishes are added" do
    it "#show_list returns both dishes and prices" do
      order = Menu.new
      order.add_dish("chicken strips", 5)
      order.add_dish("ribs", 7)
      expect(order.show_list).to eq "chicken strips £5, ribs £7"
    end
  end
  
  context "when two dishes are added and one is removed" do
    it "#show_list returns one dish and price" do
      order = Menu.new
      order.add_dish("chicken strips", 5)
      order.add_dish("ribs", 7)
      order.remove_dish("chicken strips")
      expect(order.show_list).to eq "ribs £7"
    end
  end
  
  context "when the menu is empty" do
    it "#show_list returns an error messageg" do
      order = Menu.new
      order.add_dish("chicken strips", 5)
      order.remove_dish("chicken strips")
      expect{ order.show_list }.to raise_error "The menu is empty"
    end
  end
end